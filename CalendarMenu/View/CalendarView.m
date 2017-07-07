//
//  CalendarView.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "CalendarView.h"
#import "CalendarViewItem.h"

@interface CalendarView ()<NSCollectionViewDataSource, NSCollectionViewDelegate>

@property (weak) IBOutlet NSCollectionView *collectionView;
@property (weak) IBOutlet NSScrollView *scrollView;
@property (weak) IBOutlet NSButton *previousButton;
@property (weak) IBOutlet NSButton *nextButton;
@property (weak) IBOutlet NSButton *titileButton;

@property (strong, nonatomic) YXView *headerView;

@property (assign, nonatomic) NSInteger items;
@property (strong, nonatomic) NSDate *viewDate;
@property (assign, nonatomic) NSInteger selectedIndex;


@end

@implementation CalendarView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
    self.currentDate = [NSDate date];
    [self.collectionView registerClass:[CalendarViewItem class] forItemWithIdentifier:@"CalendarViewItem"];
    
    NSShadow *dropShadow = [[NSShadow alloc] init];
    [dropShadow setShadowColor:[NSColor blackColor]];
    [dropShadow setShadowOffset:NSMakeSize(0, -10.0)];
    [dropShadow setShadowBlurRadius:10.0];
    
    [self setWantsLayer: YES];
    [self setShadow: dropShadow];
}

- (void)setupHeaderView {
    self.headerView = [[YXView alloc] init];
    self.headerView.wantsLayer = YES;
    [self.headerView.layer setBackgroundColor:[StyleModel sharedInstance].backgroundColor.CGColor];
    
    [self addSubview:self.headerView];
    CGFloat width = [StyleModel sharedInstance].itemSize.width;
    CGFloat height = [StyleModel sharedInstance].headerHeight;
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo([StyleModel sharedInstance].itemSize.width * 7);
        make.bottom.mas_equalTo(self.collectionView.mas_top);
        make.height.mas_equalTo(height);
    }];
    for (int i = 0; i < 7; i++) {
        NSTextField *textField = [[NSTextField alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        textField.backgroundColor = [StyleModel sharedInstance].backgroundColor;
        textField.selectable = NO;
        textField.editable = NO;
        textField.bordered = NO;
        textField.stringValue = [NSString localizedWeekDay:i];
        textField.font = [NSFont systemFontOfSize:[StyleModel sharedInstance].feastFontSize];
        textField.textColor = [NSColor whiteColor];

        [self.headerView addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.headerView.mas_left).offset(i * width + width / 2);
            make.centerY.mas_equalTo(self.headerView.mas_top).offset(height / 2);
//            make.width.mas_equalTo(width);
//            make.height.mas_equalTo(height);
        }];
    }
}

- (void)setCurrentDate:(NSDate *)currentDate
{
    _currentDate = currentDate;
    _selectedDate = currentDate;
    _viewDate = currentDate;
    [self setUp];
    [self refreshUI];
}

- (void)setViewDate:(NSDate *)viewDate {
    _viewDate = viewDate;
    [self setUp];
    [self refreshUI];
}

//过0点之后 刷新当前时间
- (void)update
{
    
}

- (void)setUp
{
    self.items = 42;
    self.selectedIndex = -1;
//    NSInteger currentMonthDays =  [self.viewDate currentMonthDays];
//    NSDate *date = self.viewDate;
//    NSDate *thisMonthFirstDate = [date beginOfMonth];
//    NSDate *thisMonthLastDate = [date endOfMonth];
//    NSInteger firstWeek = [thisMonthFirstDate weekday];
//    NSInteger lastWeek = [thisMonthLastDate weekday];
//    self.items = currentMonthDays + 21 - firstWeek - lastWeek;
}

- (void)setupUI {
    NSButtonCell *buttonCell = self.previousButton.cell;
    buttonCell.highlightsBy = NSContentsCellMask;
    
    ((NSButtonCell *)self.nextButton.cell).highlightsBy = NSContentsCellMask;
    ((NSButtonCell *)self.titileButton.cell).highlightsBy = NSContentsCellMask;
    [self setupHeaderView];
}

- (void)refreshUI {
    NSString *title = [self.viewDate stringWithFormat:@"yyyy MM dd"];
    self.titileButton.toolTip = @"回到今天";
    self.titileButton.attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName: [StyleModel sharedInstance].titleColor}];
    [self.collectionView reloadData];
    [self.collectionView selectItemsAtIndexPaths:[NSSet setWithObject:[NSIndexPath indexPathForItem:self.selectedIndex inSection:0]] scrollPosition:NSCollectionViewScrollPositionNone];
}

- (IBAction)respondToTitleButton:(NSButton *)sender {
    self.viewDate = self.currentDate;
}

- (IBAction)respondToPreviousButton:(NSButton *)sender {
    self.viewDate = [self.viewDate dateByAddingMonths:-1];
}

- (IBAction)respondToNextButton:(NSButton *)sender {
    self.viewDate = [self.viewDate dateByAddingMonths:1];
}

- (NSDate *)dateWithIndex:(NSInteger)index
{
    NSDate *date = self.viewDate;
    NSDate *thisMonthFirstDate = [date beginOfMonth];
    NSInteger firstWeek = [thisMonthFirstDate weekday];
    if (index < 7) {
        return [thisMonthFirstDate dateByAddingDays:-(firstWeek - index - 1)];
    }
    NSDate *indexDate = [thisMonthFirstDate dateByAddingDays:index - (firstWeek - 1)];
    if ([indexDate isToday] && self.selectedIndex == -1) {
        self.selectedIndex = index;
    }
    return indexDate;
}


#pragma mark NSCollectionViewDataSource, NSCollectionViewDelegate
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarViewItem *item = [collectionView makeItemWithIdentifier:@"CalendarViewItem" forIndexPath:indexPath];
    NSDate *itemDate = [self dateWithIndex:indexPath.item];
    item.isViewMonth = [itemDate isSameMonthToDate:self.viewDate];
    [item setDate:itemDate];
    return item;
}

- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths
{
    NSIndexPath *indexPath = [indexPaths anyObject];
    self.selectedDate = [self dateWithIndex:indexPath.item];
}

//- (void)drawRect:(NSRect)dirtyRect
//{
//    NSShadow *shadow = [[NSShadow alloc] init];
////    [shadow setShadowBlurRadius:4.0f];
//    [shadow setShadowOffset:CGSizeMake(2.0f, -2.0f)];
//    [shadow setShadowColor:[NSColor redColor]];
////    [self setShadow:shadow];
//    
//    [NSGraphicsContext saveGraphicsState] ;
////    self.wantsLayer = YES ;     // or NO
//    [shadow set] ;
//    [super drawRect:dirtyRect] ;
//    [NSGraphicsContext restoreGraphicsState] ;
//}

@end
