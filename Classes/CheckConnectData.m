//
//  CheckConnectData.m
//  openconnect-example
//
//  Created by NavidShokoufeh on 1403-08-01.
//

#import "CheckConnectData.h"
#import "NodeModel.h"

@implementation CheckConnectData

+(NSDictionary*)checkConnectParmer:(NodeModel*)modal {
    if([modal.nodeName isEqualToString:@"SSH"]) {
        NSMutableDictionary *params = [@{
            @"type": @"sshtunnel",
            @"username": modal.username,
            @"password": modal.password,
            @"address": modal.server,
            @"port": modal.port,
        } mutableCopy];
        
        if (modal.udpgw) {
            params[@"udpgw"] = modal.udpgw;
        }
        
        if (modal.udpgw_port) {
            params[@"udpgw_port"] = modal.udpgw_port;
        }
        return [params copy];
        
    }else if([modal.nodeName isEqualToString:@"SSTP"]){
        return @{@"type":@"sstp",
                 @"username":modal.username,
                 @"password":modal.password,
                 @"address":modal.server,
                 @"port":modal.port,
                 @"chap_enable":@(modal.CHAP),
                 @"mschap2_enable":@(modal.MSCHAP2),
                 @"pap_enable":@(modal.PAP),
                 @"allowInsecure":@(modal.TLS),
                };
    }else if([modal.nodeName isEqualToString:@"openConnect"]){
        return @{@"type":@"openconnect",
                 @"username":modal.username,
                 @"password":modal.password,
                 @"address":modal.server,
                 @"port":modal.port,
                 @"chap_enable":@(modal.CHAP),
                 @"mschap2_enable":@(modal.MSCHAP2),
                 @"pap_enable":@(modal.PAP),
                 @"allowInsecure":@(modal.TLS),
                };
    }
    return @{};
}

+(NodeModel*)getModalForDic:(NSDictionary*)selectDic {
    if([selectDic[@"type"] isEqualToString:@"sshtunnel"]) {
        NodeModel * modal = [NodeModel new];
        modal.nodeName = @"SSH";
        modal.username =selectDic[@"username"];
        modal.password =selectDic[@"password"];
        modal.server =selectDic[@"address"];
        modal.port =selectDic[@"port"];
        modal.TLS =[selectDic[@"allowInsecure"] boolValue];
        modal.PAP =[selectDic[@"pap_enable"] boolValue];
        modal.CHAP =[selectDic[@"chap_enable"] boolValue];
        modal.MSCHAP2 =[selectDic[@"mschap2_enable"] boolValue];
        modal.udpgw =selectDic[@"udpgw"];
        modal.udpgw_port =selectDic[@"udpgw_port"];
        return modal;
        
    }else if([selectDic[@"type"] isEqualToString:@"sstp"]) {
        NodeModel * modal = [NodeModel new];
        modal.nodeName = @"SSTP";
        modal.username =selectDic[@"username"];
        modal.password =selectDic[@"password"];
        modal.server =selectDic[@"address"];
        modal.PAP =[selectDic[@"pap_enable"] boolValue];
        modal.CHAP =[selectDic[@"chap_enable"] boolValue];
        modal.MSCHAP2 =[selectDic[@"mschap2_enable"] boolValue];
        modal.port =selectDic[@"port"];
        modal.TLS =[selectDic[@"allowInsecure"] boolValue];
        return modal;

    }else if([selectDic[@"type"] isEqualToString:@"openconnect"]){
        NodeModel * modal = [NodeModel new];
        modal.nodeName = @"openConnect";
        modal.username =selectDic[@"username"];
        modal.password =selectDic[@"password"];
        modal.server =selectDic[@"address"];
        modal.PAP =[selectDic[@"pap_enable"] boolValue];
        modal.CHAP =[selectDic[@"chap_enable"] boolValue];
        modal.MSCHAP2 =[selectDic[@"mschap2_enable"] boolValue];
        modal.port =selectDic[@"port"];
        modal.TLS =[selectDic[@"allowInsecure"] boolValue];
        return modal;

    }
    return NodeModel.new;
}

@end
