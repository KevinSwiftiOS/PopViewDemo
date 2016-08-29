//
//  PopAlertView.m
//  PopViewDemo
//
//  Created by hznucai on 2016/8/28.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import "PopAlertView.h"
#define kWidth self.frame.size.width
#define kHeight self.frame.size.height
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
@interface PopAlertView ()
@property(nonatomic,strong)UIView *bigBackClearView;
@property(nonatomic,strong)UIView *showBackView;
@property(nonatomic,strong)UIView *blackBackView;
//标题
@property(nonatomic,strong)UILabel *labelTitle;
//规则文字
@property(nonatomic,strong)NSArray *textArray;
//label数组
@property(nonatomic,strong)NSMutableArray *labelArray;
@end
@implementation PopAlertView
-(instancetype)initWithFrame:(CGRect)frame withTextArray:(NSArray *)textArray{
    if(self = [super initWithFrame:frame]){
        //?
        TriangleView *tv = [[TriangleView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 15)];
        tv.backgroundColor = [UIColor clearColor];
        self.textArray = textArray;
        [self addSubview:tv];
        [self setUPUI];
    }
    return self;
}
//进行显示的View
+(void)showWithFrame:(CGRect)frame WithTextArray:(NSArray *)textArray{
    PopAlertView *tv = [[PopAlertView alloc]initWithFrame:frame withTextArray:textArray];
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [win addSubview:tv.bigBackClearView];
    [tv.bigBackClearView addSubview:tv];
    tv.alpha = 0;
    //?
    tv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        tv.alpha = 1;
        tv.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)hide:(UIButton *)button{
    [self hideCurrentView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self hideCurrentView]
}
-(void)hideCurrentView{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
    } completion:^(BOOL finished) {
        [self.bigBackClearView removeFromSuperview];
        [self removeFromSuperview];
    }];
}
//?
#pragma mark - 创建UI -
-(void)setUPUI{
    self.showBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, kWidth, kHeight - 15)];
    [self addSubview:self.showBackView];
    self.blackBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, CGRectGetHeight(self.showBackView.frame))];
    self.blackBackView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    self.blackBackView.layer.cornerRadius = 3;
    self.blackBackView.clipsToBounds = true;
    [self.showBackView addSubview:self.blackBackView];
   
    self.labelTitle = [[UILabel alloc]init];
    self.labelTitle.text = @"金币规则";
    self.labelTitle.textColor = [UIColor whiteColor];
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    self.labelTitle.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.labelTitle];
   
    self.labelArray = [NSMutableArray array];
    for(NSInteger i = 0; i < self.textArray.count;i++){
        UILabel *label = [[UILabel alloc]init];
        label.text = [self.textArray objectAtIndex:i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.numberOfLines = 0;
        [self addSubview:label];
        [self.labelArray addObject:label];
    }
    //遮挡住背面的View
    self.bigBackClearView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideCurrentView)];
    [self.bigBackClearView addGestureRecognizer:tap];
}
#pragma mark - 约束子类 -
//?
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat topPadding = 15;
    CGFloat leftPadding = 7;
    self.labelTitle.frame = CGRectMake(0, topPadding + 14, kWidth, 20);
    //?
    [self. labelArray enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx == 0){
            label.frame = CGRectMake(leftPadding, CGRectGetMaxY(self.labelTitle.frame) + 14, kWidth - 2 *leftPadding,[self countWidth:kWidth - 2 * leftPadding Label:label] );
        }else{
            UILabel *labelBefore = self.labelArray[idx - 1];
            label.frame = CGRectMake(leftPadding, CGRectGetMaxY(labelBefore.frame) + 14, kWidth - 2 *leftPadding,[self countWidth:kWidth - 2 * leftPadding Label:label] );
        }
    }];
    if(self.labelArray.count == 0){
        return;
    }
    UILabel *labelLast = self.labelArray[self.labelArray.count - 1];
    self.showBackView.frame = CGRectMake(0, 15, kWidth, CGRectGetMaxY(labelLast.frame));
    self.blackBackView.frame = CGRectMake(0, 0, kWidth, CGRectGetHeight(self.showBackView.frame));
}
//计算label的高度
-(CGFloat)countWidth:(CGFloat)width Label:(UILabel *)label{
    //?
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
    return size.height;
}

    /*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
//绘制三角形
@implementation TriangleView
-(void)drawRect:(CGRect)rect{
    CGFloat leftPadding = 50;
    CGFloat triangleWidth = 15;
    CGPoint sPoint[3];
    sPoint[0] = CGPointMake(kWidth - leftPadding, 0);
    sPoint[1] = CGPointMake(kWidth - leftPadding - triangleWidth / 2, triangleWidth);
    sPoint[2] = CGPointMake(kWidth - leftPadding + triangleWidth / 2, triangleWidth);
    //?
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    //填充颜色
    CGContextSetFillColorWithColor(context, color.CGColor);
    //划线
    CGContextAddLines(context, sPoint, 3);
    //封装
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}

@end
