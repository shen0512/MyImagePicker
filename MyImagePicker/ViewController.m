//
//  ViewController.m
//  MyImagePicker
//
//  Created by Shen on 2022/4/2.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate>{
    UIImagePickerController *picker;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.allowsEditing = YES;
    /*
     UIImagePickerControllerSourceTypeCamera
     UIImagePickerControllerSourceTypePhotoLibrary
     UIImagePickerControllerSourceTypeSavedPhotosAlbum
     */
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
}

- (IBAction)btnClick:(id)sender {
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    dispatch_async(dispatch_get_main_queue(), ^(){
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        self.imageView.image = chosenImage;

        [picker dismissViewControllerAnimated:YES completion:nil];
    });
    
}

@end
