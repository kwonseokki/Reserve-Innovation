//
//  FindReserveViewModel.swift
//  FindReserve
//
//  Created by a on 11/10/25.
//

import Combine
import MultipeerConnectivity

class FindReserveViewModel: NSObject, ObservableObject {
    private var session: MCSession!
    private var advertiser: MCNearbyServiceAdvertiser!
    private var browser: MCNearbyServiceBrowser!
    private let localPeerID = MCPeerID(displayName: UIDevice.current.name)
    private let matchServiceType: String = "Match-service"
    
    var isConnected: Bool {
        session.connectedPeers.count > 0
    }
    
    @Published var connectedPeerCount = 0
    @Published var connecteComplete: Bool = false
    
    override init() {
        super.init()
        self.advertiser = MCNearbyServiceAdvertiser(
            peer: localPeerID,
            discoveryInfo: nil,
            serviceType: matchServiceType
        )
                
        advertiser.delegate = self
        // 근처 피어에게 세션참여 요청
        advertiser.startAdvertisingPeer()
        
        self.session = MCSession(
            peer: localPeerID,
            securityIdentity: nil,
            encryptionPreference: .none
        )
        
        session.delegate = self
        
        self.browser = MCNearbyServiceBrowser(peer: localPeerID, serviceType: matchServiceType)
        browser.delegate = self
        // 주변 기기 탐색
        browser.startBrowsingForPeers()
    }
    
    deinit {
        advertiser.stopAdvertisingPeer()
        browser.stopBrowsingForPeers()
    }
}

extension FindReserveViewModel: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
        print(#function)
        
    }
}

extension FindReserveViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            connectedPeerCount = session.connectedPeers.count + 1
            if connectedPeerCount == 4 {
                connecteComplete = true
            }
        }
        print(#function)
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print(#function)
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

extension FindReserveViewModel: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("peerID \(localPeerID)")
        // 근처에 피어 발견시 초대
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 30)
        
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print(#function)
    }
}
