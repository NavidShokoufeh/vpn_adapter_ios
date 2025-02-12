//
//  NodeModel.h
//
//  Created by NavidShokoufeh on 1403-08-01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NodeModel : NSObject

@property (nonatomic,copy) NSString * nodeName;
@property (nonatomic,copy) NSString * server;
@property (nonatomic,copy) NSString * port;
@property (nonatomic,copy) NSString * password;
@property (nonatomic,copy) NSString * desc;
@property (nonatomic,copy) NSString * username;
@property (nonatomic,copy) NSString * udpgw;
@property (nonatomic,copy) NSString * udpgw_port;

@property (nonatomic,copy) NSString * proxy_host;
@property (nonatomic,copy) NSString * proxy_port;
@property (nonatomic,copy) NSString * proxy_username;
@property (nonatomic,copy) NSString * proxy_password;

@property (nonatomic,assign) BOOL TLS;
@property (nonatomic,assign) BOOL PAP;
@property (nonatomic,assign) BOOL CHAP;
@property (nonatomic,assign) BOOL MSCHAP2;

@property (nonatomic,assign) BOOL isSelected;
@property (nonatomic,strong) NodeModel * selectNode;

+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
