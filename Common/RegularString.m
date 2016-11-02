//
//  RegularString.m
//  Common
//
//  Created by 程嘉雯 on 15/12/5.
//  Copyright © 2015年 com.epoluodi.Common. All rights reserved.
//

#import "RegularString.h"

@implementation RegularString


+(BOOL)ValidateEmail:(NSString *)email
{
//    NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";
//    NSError *error = NULL;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?:[^,])*\\." options:NSRegularExpressionCaseInsensitive error:&error];
//    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
//    if (result) {
//        NSLog(@"%@\n", [searchText substringWithRange:result.range]);
//    }
    

    NSString* regex=@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *mail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [mail evaluateWithObject:email];
}

+(BOOL)ValidIP:(NSString *)ip
{
    
    
    NSString* regex=@"^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$";
    NSPredicate *mail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [mail evaluateWithObject:ip];
    
    
  
}
@end
