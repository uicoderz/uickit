#import <UIKit/UIKit.h>

typedef enum {
	UICCellTypeNormal,
	UICCellTypeNoRound,
	UICCellTypeRound,
	UICCellTypeRoundSpeech,
	UICCellTypeRoundTop,
	UICCellTypeRoundBottom,

} UICCellType;


// for internal use only ////////////
@protocol UICCellBackgroundDelegate
- (void)drawBackgroundRect:(CGRect)rect;

@end

@interface UICCellBackground : UIView
{
	NSObject<UICCellBackgroundDelegate> *delegate;
}
- (id)initWithDelegate:(NSObject<UICCellBackgroundDelegate>*)delegate;

@end
// //////////////////////////////////

@interface UICTableViewCell : UITableViewCell<UICCellBackgroundDelegate> {
	UICCellType cellType;
	UIColor *bgcolor;
	CGGradientRef gradientForNormal;
	CGGradientRef gradientForSelected;
}

@property (readwrite) UICCellType cellType;
@property (readwrite,assign) UIColor *bgcolor;

- (void)drawRect:(CGRect)rect;
- (void)drawSelectedBackgroundRect:(CGRect)rect;

@end
