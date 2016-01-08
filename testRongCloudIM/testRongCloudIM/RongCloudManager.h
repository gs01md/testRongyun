//
//  RongCloudInit.h
//  testRongCloudIM
//
//  Created by WoodGao on 16/1/8.
//  Copyright © 2016年 wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>

@interface RongCloudManager : NSObject
+(RongCloudManager *)sharedManager;
-(RCConversationViewController*)chatViewWithType:(RCConversationType)type withId:(NSString*)chatId;
@end
