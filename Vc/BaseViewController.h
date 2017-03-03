//
//  BaseViewController.h
//  DevFrameworkDemo
//
//  Created by cnmobi on 16/6/16.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  信用还是红本
 */

typedef enum : NSUInteger {
    creditType,         ///<信用
    redBookType,        ///<红本
} loanType;

@interface BaseViewController : UIViewController

@end
