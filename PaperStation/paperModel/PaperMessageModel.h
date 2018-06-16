//
//  PaperMessageModel.h
//  PaperStation
//
//  Created by tybbt on 2018/6/13.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <JSONModel/JSONModel.h>

typedef NS_ENUM(NSInteger, ContentType) {
    ContentTypeTextOnly,
    ContentTypeWithImage,
    ContentTypeWithAudio,
    ContentTypeFullContent
};

@interface UserDataModel : JSONModel
@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, copy) NSString * nickName;
@property (nonatomic, assign) int weight;
@end

@interface ContentModel : JSONModel
@property (nonatomic, assign) ContentType contentType;
@property (nonatomic, assign) int * PaperBackgroundType;
@property (nonatomic, copy) NSString * contentText;
@property (nonatomic, copy) NSString * contentImageData;
@property (nonatomic, copy) NSString * contentAudioData;
@property (nonatomic, copy) NSDate * date;
@end

@interface PaperMessageModel : JSONModel
@property (nonatomic, assign) NSInteger messageID;
@property (nonatomic, strong) UserDataModel * from;
@property (nonatomic, strong) UserDataModel * target;
@property (nonatomic, strong) ContentModel * content;
@end




