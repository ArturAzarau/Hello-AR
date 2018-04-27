//
//  DIsplayTextController.swift
//  Hello-AR
//
//  Created by Артур Азаров on 27.04.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class DIsplayTextController: UIViewController, ARSCNViewDelegate {

    // MARK: Properties
    var sceneView: ARSCNView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    // MARK: - Methods
    private func setUp() {
        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)

        sceneView.delegate = self

        sceneView.showsStatistics = true

        let scene = SCNScene()
        let textGeometry = SCNText(string: "Hello World!", extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.yellow

        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(0, 0.1, 0.5)
        textNode.scale = SCNVector3(0.02, 0.02, 0.02)

        scene.rootNode.addChildNode(textNode)

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
