//
//  AppDelegate.m
//  password-assistant
//
//  Created by Martin Alleus on 2016-07-06.
//  Copyright © 2016 Appcorn. All rights reserved.
//

#import "AppDelegate.h"
#import "SFPasswordAssistantInspectorController.h"

@interface AppDelegate () <NSWindowDelegate>
    @property(nonatomic) SFPasswordAssistantInspectorController *pwAsst;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self showPasswordAssistantPanel];
}

- (void)showPasswordAssistantPanel {
    if (self.pwAsst) {
        [self.pwAsst closePasswordAssistantPanel];
    }

    self.pwAsst = [[SFPasswordAssistantInspectorController alloc] init];
    [self.pwAsst showPasswordAssistantPanel:nil];

    NSPanel* panel = [self.pwAsst panel];
    panel.delegate = self;

    [panel makeKeyAndOrderFront:nil];
}

- (BOOL)windowShouldClose:(id)sender {
    exit(1);
}

@end
