#import <Foundation/Foundation.h>

@class KPBRelationShipBuilder;

extern KPBRelationShipBuilder *RelationShip();

@interface KPBRelationShipBuilder : NSObject

@property (nonatomic, copy) KPBRelationShipBuilder *(^from)(NSString *);
@property (nonatomic, copy) KPBRelationShipBuilder *(^to)(NSString *);

@end