//
//  AdminProofs.swift
//  Aries
//
//  Created by David Clawson on 12/14/21.
//

import Foundation


public class AdminProofs {
    
    private var messageSender: MessageSender
    private var adminConnection: ConnectionRecord

    public init (messageSender: MessageSender, adminConnection: ConnectionRecord){
        self.messageSender = messageSender
        self.adminConnection = adminConnection
    }

    private func setAdminConnection(adminConnection: ConnectionRecord){
        self.adminConnection = adminConnection
    }
    
    public func sendGetPresentations(){
        let message = PresentationsGetListMessage(connectionId: "") //Figure out paramater
        self.messageSender.sendMessage(message: message, connectionRecord: adminConnection)
    }
    
    //TODO - PresentationsListMessage does not contain thread information
    public func sendGetPresentationsByConnection(connectionId: String){
        let message = PresentationsGetListMessage(connectionId: "") // Figure out parameter
        self.messageSender.sendMessage(message: message, connectionRecord: self.adminConnection)
    }
    
    public func sendGetMatchingCredentials(presentationExchangeId: String) -> AdminMatchingCredentialsRecord {
        let message = PresentationMatchingCredentialsMessage(thread: <#T##String#>, presentationExchangeId: <#T##String#>, matchingCredentials: <#T##[MatchingCredentials]#>, page: <#T##PageDecorator#>)
        
        return AdminMatchingCredentialsRecord()
    }
    
    public func sendAcceptRequest(record: AdminMatchingCredentialsRecord, presentationRequest: PresentationRequest) -> AdminMessageConfirmationRecord {
        let message = PresentationRequestApproveMessage(record: <#T##AdminMatchingCredentialsRecord#>, presentationRequest: <#T##PresentationRequest#>, selfAttestedAttributes: <#T##[String : String]#>, comment: <#T##String#>)
        let sentMessage = self.messageSender.sendMessage(message: message, connectionRecord: self.adminConnection)
        let returnMessage = AdminMessageConfirmationRecord(message: sentMessage, adminConnection: self.adminConnection)
        return returnMessage
    }
    
}
