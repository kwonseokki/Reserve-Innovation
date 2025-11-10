//
//  ConnectivityManager.swift
//  FindReserve
//
//  Created by a on 11/10/25.
//

import Combine
import MultipeerConnectivity

class ConnectivityManager: NSObject, ObservableObject {
    static let shared = ConnectivityManager()
    
    private var session: MCSession!
    private var advertiser: MCNearbyServiceAdvertiser!
    private var browser: MCNearbyServiceBrowser!
    private let localPeerID = MCPeerID(displayName: UIDevice.current.name)
    private let matchServiceType: String = "Match-service"
    private var connectetime: Int = 0
    private var timer: AnyCancellable?
    
    var isConnected: Bool {
        session.connectedPeers.count > 0
    }
    
    @Published var connectedPeerCount = 0
    @Published var connecteComplete: Bool = false
    
    var receivedData: ((String) -> Void)?
    
    override private init() {
        super.init()
        configureSession()
    }
     
    // 세션 구성
    func configureSession() {
        self.advertiser = MCNearbyServiceAdvertiser(
            peer: localPeerID,
            discoveryInfo: nil,
            serviceType: matchServiceType
        )
        advertiser.delegate = self
        
        self.session = MCSession(
            peer: localPeerID,
            securityIdentity: nil,
            encryptionPreference: .none
        )
        
        session.delegate = self
        
        self.browser = MCNearbyServiceBrowser(peer: localPeerID, serviceType: matchServiceType)
        browser.delegate = self
    }
    
    // 세션 중지
    func stopSession() {
        advertiser.stopAdvertisingPeer()
        browser.stopBrowsingForPeers()
        timer = nil
    }
    
    // 세션 시작
    func startSession() {
        
        // 근처 피어에게 세션참여 요청
        advertiser.startAdvertisingPeer()
        // 주변 기기 탐색
        browser.startBrowsingForPeers()
        
        timer =  Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                connectetime += 1
                if connectedPeerCount == 4 || (connectetime > 5 && connectedPeerCount >= 2) {
                    connecteComplete = true
                }
            })
    }
    
    // 데이터 전송
    func sendData(_ data: Data) throws {
        try session.send(data, toPeers: session.connectedPeers, with: .reliable)
    }
}

extension ConnectivityManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
        print(#function)
        
    }
}

extension ConnectivityManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            connectedPeerCount = session.connectedPeers.count + 1
        }
        print(#function)
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(String.self, from: data)
            receivedData?(data)
        } catch {
            
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print(#function)
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print(#function)
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: (any Error)?) {
        print(#function)
    }
}

extension ConnectivityManager: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("peerID \(localPeerID)")
        // 근처에 피어 발견시 초대
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 30)
        
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print(#function)
    }
}
