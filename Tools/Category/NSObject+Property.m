//
//  NSObject+Property.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];

    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        //        NSLog(@"%@ %@",propertyName,[value class]);
        NSString *code;
        
         NSLog(@"%@",[value class]);
        
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        else if ([value isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName]
            ;
        }
        //array
        else if ([value isKindOfClass:NSClassFromString(@"__NSArray0")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName]
            ;
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSArrayI")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName]
            ;
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName]
            ;
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSSingleObjectArrayI")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",propertyName]
            ;
        }
        //dict
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSDictionary *%@;",propertyName]
            ;
        }
        [strM appendFormat:@"\n%@\n",code];
        
       
        
    }];
    
     NSLog(@"%@",strM);
   
   
    
}

@end
