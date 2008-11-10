#import "SampleLabeledTableCell.h"

@implementation SampleLabeledTableCell

- (void)setupView {

	{
		UILabel *label2;
		label2 = [[[UILabel alloc] initWithFrame:CGRectMake(10,4,150,20)] autorelease];
		label2.font = [UIFont boldSystemFontOfSize:12.f];
		label2.textColor = [UIColor colorWithWhite:0.2f alpha:1.f];
//		label2.backgroundColor = [UIColor whiteColor];
		label2.backgroundColor = [UIColor clearColor];
	//	label2.lineBreakMode = UILineBreakModeWordWrap;
		label2.numberOfLines = 1;
		label2.text = @"テストてすと";
		[self addSubview:label2];
	}
	
	{
		UILabel *label2;
		label2 = [[[UILabel alloc] initWithFrame:CGRectMake(160,4,150,20)] autorelease];
		label2.font = [UIFont boldSystemFontOfSize:12.f];
		label2.textColor = [UIColor colorWithWhite:0.2f alpha:1.f];
//		label2.backgroundColor = [UIColor whiteColor];
		label2.backgroundColor = [UIColor clearColor];
	//	label2.lineBreakMode = UILineBreakModeWordWrap;
		label2.numberOfLines = 1;
		label2.text = @"ラベル2";
		[self addSubview:label2];
	}
	
	label = [[UILabel alloc] initWithFrame:CGRectMake(10,20,300,40)];
	label.font = [UIFont systemFontOfSize:14.f];
	label.textColor = [UIColor colorWithWhite:0.2f alpha:1.f];
//	label.backgroundColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.numberOfLines = 0;
	[self addSubview:label];
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		[self setupView];
    }
    return self;
}

/*
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
*/

- (void)dealloc {
	[label release];
    [super dealloc];
}

- (void)setText:(NSString*)text {
	label.text = text;
}

@end
