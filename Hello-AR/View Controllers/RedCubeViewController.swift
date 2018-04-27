//
//  ViewController.swift
//  Hello-AR
//
//  Created by Артур Азаров on 27.04.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create new scene view
        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)

        // Set the view's delegate
        sceneView.delegate = self

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true

        // Create a new scene

        let scene = SCNScene()

        // Create 3D box
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIColor.red

        // Create a node
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.geometry?.materials = [boxMaterial]
        boxNode.position = SCNVector3(0, 0.1, -0.5)

        scene.rootNode.addChildNode(boxNode)
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
