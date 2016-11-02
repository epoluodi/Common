//
//  PublicCommon.m
//  Common
//
//  Created by 程嘉雯 on 15/8/8.
//  Copyright (c) 2015年 com.epoluodi.Common. All rights reserved.
//

#import "PublicCommon.h"

@implementation PublicCommon


+(CGRect)GetALLScreen
{
    CGRect r = [UIScreen mainScreen ].applicationFrame;
    return r;
}


+(CGRect)GetScreen
{
    CGRect r = [ UIScreen mainScreen ].bounds;
    return r;
}

+(NSString *)getNow
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString * date = [formatter stringFromDate:[NSDate date]];
    return date;
}



+(struct Deviceinfo )DeviceName
{
    struct Deviceinfo deviceinfo;
    
    
    deviceinfo.dmodel =[UIDevice currentDevice].model;
    deviceinfo.dname = [UIDevice currentDevice].systemName;
    deviceinfo.uuid = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return deviceinfo;
    
}



+(UIToolbar *)getInputToolbar:(id)sender sel:(SEL)sel
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 35)];
    
    [topView setBarStyle:UIBarStyleBlackOpaque];
    
    
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:sender action:sel];
    
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    
    
    
    [topView setItems:buttonsArray];
    return topView;
    
}



+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

+(UIImage *)imageFromView: (UIView *) theView atFrame:(CGRect)r
{
    
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


//通过颜色创建图片
+ (UIImage*) createImageWithColor: (UIColor*) color Rect:(CGRect) rect
{
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


+(NSString *)getDateStringWithFormat:(NSString *)format
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString * str = [formatter stringFromDate:[NSDate date]];
    return str;
}
+(NSString *)getDateStringWithDT:(NSString *)strDT
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate * date = [formatter dateFromString:strDT];
    
    
    NSDate * now = [NSDate date];
    
    NSTimeInterval timeBetween = [now timeIntervalSinceDate:date];
    NSLog(@"时间间隔 %f",timeBetween);
    
    float day =timeBetween  / 3600 / 24 ;
    
    if (day > 7)
    {
        [formatter setDateFormat:@"MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
    else if (day< 1)
    {
        [formatter setDateFormat:@"今天 HH:mm"];
        return [formatter stringFromDate:date];
    }
    else
    {
        NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
        
        [calendar setTimeZone: timeZone];
        
        NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
        
        NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
        [formatter setDateFormat:@"HH:mm"];
        
        return [NSString stringWithFormat:@"%@ %@", [weekdays objectAtIndex:theComponents.weekday] , [formatter stringFromDate:date]];
    }
    return @"";
}




+(NSString *)dateTran:(NSDate *)date
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *compsnow = [[NSDateComponents alloc] init];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSYearCalendarUnit |NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    compsnow = [calendar components:unitFlags fromDate:now];
    comps = [calendar components:unitFlags fromDate:date];
    
    if (comps.month==compsnow.month &&
        comps.day == compsnow.day)
    {
        df.dateFormat  = @"今天 HH:mm:ss";
        return [df stringFromDate:date];
    }
    else
    {
        df.dateFormat  = @"MM-dd HH:mm:ss";
        return [df stringFromDate:date];
    }
    
}
@end
