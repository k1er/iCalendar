//
//  Date.h
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject

@property (copy, nonatomic) NSString *lunar;

@property (copy, nonatomic) NSString *day;

//节日
@property (copy, nonatomic) NSString *feast;

@property (assign, nonatomic) DateType dateType;


@end
