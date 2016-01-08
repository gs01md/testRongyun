//
//  RongCloudInit.m
//  testRongCloudIM
//
//  Created by WoodGao on 16/1/8.
//  Copyright © 2016年 wood. All rights reserved.
//

#import "RongCloudManager.h"

@implementation RongCloudManager

+(RongCloudManager *)sharedManager{
    static RongCloudManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RongCloudManager alloc] init];
        
    });
    
    return sharedInstance;
}

-(instancetype)init{
    
    if (self = [super init]) {
        [self initCloud];
    }
    
    return self;
    
}

/**
 *  获取token接口
 *  应该从服务器获取
 *  @return 该用户的token
 */
-(NSString*)getToken{
    return @"O3eQVQPnKIlas1tXaxbrusvJfNDuWJS7XlkqrdMAr4xCvMZwJWpfpBIGBWaWokEqZUN425CmPHbuR3xt6WMc+Q==";
}

/**
 *  初始化信息
 */
-(void)initCloud{
    [[RCIM sharedRCIM] initWithAppKey:@"c9kqb3rdkutfj"];
    
    [[RCIM sharedRCIM] connectWithToken:[self getToken] success:^(NSString *userId) {
        NSLog(@"登录成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登录的错误码为:%ld", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];

}

/**
 *  聊天界面
 */
-(RCConversationViewController*)chatViewWithType:(RCConversationType)type withId:(NSString*)chatId{
    //新建一个聊天会话View Controller对象
    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = type;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    chat.targetId = chatId;
    //设置聊天会话界面要显示的标题
    chat.title = chatId;
    
    return chat;
}

@end
