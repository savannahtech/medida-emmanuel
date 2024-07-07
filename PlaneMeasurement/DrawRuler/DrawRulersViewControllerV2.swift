//
//  DrawRulersViewControllerV2.swift
//  PlaneMeasurement
//
//  Created by Ayokunle Fatokimi on 02/07/2024.
//

import SceneKit
import SpriteKit
import MagnifyingGlass
import ARKit

class DrawRulersViewController: UIViewController {

    // MARK: - View Elements
    var scene: SCNScene!
    var sceneView: SCNView!
    var imageView: UIImageView!

    // MARK: - State from SceneReconstructionVC
    var pointOfView: SCNNode?
    var image: UIImage
    var frame: ARFrame
    var oldRootNode: SCNNode

    // MARK: - Tracking vertices / edges
    var quadNode: QuadNode!
    var skScene: SKScene {
        sceneView.overlaySKScene!
    }
    var panningState: PanningState = .first
    var dummyNode = SCNNode()

    let magnifyingGlass = MagnifyingGlassView(
        offset: CGPoint.zero,
        radius: 50.0,
        scale: 2,
        crosshairColor: .black,
        crosshairWidth: 0.8
    )

    // MARK: - Initializer
    init(viewSnapshot: UIImage, pov: SCNNode, frame: ARFrame, root: SCNNode) {
        self.image = viewSnapshot
        self.pointOfView = pov
        self.frame = frame
        self.oldRootNode = root
        super.init(nibName: nil, bundle: nil)
        setupScene()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        enablePanGesture()
        
        setupImageView()
        setupSceneView()
        setupQuadNode()
        setupSKScene()
    }

    // MARK: - Setup Methods
    func setupImageView() {
        imageView = UIImageView(image: image)
        imageView.frame = view.frame
        view.addSubview(imageView)
    }

    func setupScene() {
        scene = SCNScene()

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.simdTransform = frame.camera.transform
        scene.rootNode.addChildNode(cameraNode)

        // Defer node additions to the main thread
        DispatchQueue.main.async {
            for child in self.oldRootNode.childNodes {
                self.scene.rootNode.addChildNode(child)
                child.geometry?.firstMaterial?.colorBufferWriteMask = []
            }
        }
    }

    func setupSceneView() {
        sceneView = SCNView(frame: view.frame)
        sceneView.backgroundColor = UIColor.clear
        sceneView.scene = scene
        sceneView.pointOfView = pointOfView
        sceneView.autoenablesDefaultLighting = false
        view.addSubview(sceneView)
    }

    func setupQuadNode() {
        quadNode = QuadNode(sceneView: sceneView)
        scene.rootNode.addChildNode(quadNode)
        scene.rootNode.addChildNode(dummyNode)
    }

    func setupSKScene() {
        sceneView.overlaySKScene = SKScene(size: sceneView.bounds.size)
        skScene.delegate = self
        skScene.anchorPoint = CGPoint(x: 0, y: 0)
        skScene.isUserInteractionEnabled = true
        skScene.backgroundColor = .red
    }
}

