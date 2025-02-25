//
//  NotificationService.swift
//  notificationsvc
//
//  Created by D K on 25.02.2025.
//

import UserNotifications
import SdkPushExpress

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    let notificationServiceManager = NotificationManager()

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        notificationServiceManager.handleNotification(request: request, contentHandler: contentHandler)
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}

