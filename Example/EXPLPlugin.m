//
//  EXPLPlugin.m
//  Example
//
//  Created by Florian Pircher on 01.12.23.
//

#import "EXPLPlugin.h"
#import "EXPLSettings.h"
#import <GlyphsCore/GSAppDelegateProtocol.h>

@implementation EXPLPlugin

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                NSObject<GSAppDelegateProtocol> *appDelegate = (NSObject<GSAppDelegateProtocol> *)[NSApp delegate];
                if ([appDelegate respondsToSelector:@selector(addViewToPreferences:)]) {
                    [appDelegate addViewToPreferences:[EXPLSettings sharedSettings]];
                }
            });
        });
    }
    return self;
}

- (NSUInteger)interfaceVersion {
    return 1;
}

- (void)loadPlugin { 
    
}

@end
