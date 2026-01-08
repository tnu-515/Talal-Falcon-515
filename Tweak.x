#import <UIKit/UIKit.h>

// --- [ نظام القفل برقم 515 ] ---
%hook SCMainViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;

    // إنشاء نافذة التفعيل
    UIAlertController *lockAlert = [UIAlertController alertControllerWithTitle:@"Talal Falcon 🛡️"
                                   message:@"الرجاء إدخال كود التفعيل الخاص بطلال"
                                   preferredStyle:UIAlertControllerStyleAlert];

    [lockAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"أدخل الكود هنا...";
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.secureTextEntry = YES;
    }];

    UIAlertAction *verify = [UIAlertAction actionWithTitle:@"تفعيل" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        UITextField *codeField = lockAlert.textFields.firstObject;

        // التحقق من الكود 515
        if ([codeField.text isEqualToString:@"515"]) {
            // الكود صحيح، سيفتح التطبيق
        } else {
            // الكود خطأ، سيتم إغلاق التطبيق فوراً
            exit(0);
        }
    }];

    [lockAlert addAction:verify];
    [self presentViewController:lockAlert animated:YES completion:nil];
}
%end

// --- [ تفعيل مميزات بلس والبريميوم ] ---
%hook SCUserSession
- (BOOL)isPremiumUser {
    return YES;
}
- (BOOL)isSubscribedToPlus {
    return YES;
}
%end

// --- [ منع تنبيه تصوير الشاشة ] ---
%hook SCChatMessageHelper
- (void)sendScreenshotNotification {
    // فارغ لمنع التنبيه
}
%end

// --- [ ميزة الرفع من الاستديو ] ---
%hook SCGalleryVideoAsset
- (BOOL)isDirectUploadEligible {
    return YES;
}
%end
