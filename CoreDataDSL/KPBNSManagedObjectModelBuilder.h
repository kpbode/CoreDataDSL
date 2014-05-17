@import Foundation;
@import CoreData;

@class KPBEntityBuilder;
@class KPBNSManagedObjectModelAspectBuilder;
@class KPBNSManagedObjectModelEntitiesBuilder;
@class KPBNSManagedObjectModelRelationShipsBuilder;
@class KPBRelationShipBuilder;

extern NSManagedObjectModel *buildCoreDataModel(KPBNSManagedObjectModelAspectBuilder *aspectBuilder, ...);
extern KPBNSManagedObjectModelEntitiesBuilder *withEntities(KPBEntityBuilder *entities, ...);
extern KPBNSManagedObjectModelRelationShipsBuilder *withRelationShips(KPBRelationShipBuilder *relationShips, ...);

@interface KPBNSManagedObjectModelBuilder : NSObject

- (NSManagedObjectModel *)buildModel;

@end
