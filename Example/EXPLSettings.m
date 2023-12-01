//
//  EXPLSettings.m
//  Example
//
//  Created by Florian Pircher on 01.12.23.
//

#import "EXPLSettings.h"

static NSBundle *pluginBundle;

@implementation EXPLSettings

+ (instancetype)sharedSettings {
    static EXPLSettings *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pluginBundle = [NSBundle bundleForClass:[self class]];
        sharedInstance = [EXPLSettings new];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super initWithNibName:@"EXPLSettings" bundle:pluginBundle];
    if (self != nil) {
        self.title = @"Example Settings";
        self.representedObject = @"circle"; // name of SF Symbol, currently unused
    }
    return self;
}

@end
