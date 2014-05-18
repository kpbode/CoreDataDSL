#import "KPBNSManagedObjectModelBuilder.h"
#import "KPBEntityBuilder.h"
#import "KPBNSManagedObjectModelEntitiesBuilder.h"
#import "KPBNSManagedObjectModelRelationShipsBuilder.h"
#import "KPBRelationShipBuilder.h"

@interface KPBNSManagedObjectModelBuilder ()

@property (nonatomic, copy) NSArray *aspectBuilders;

@end

@implementation KPBNSManagedObjectModelBuilder

- (NSManagedObjectModel *)buildModel
{
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel new];
    
    for (KPBNSManagedObjectModelAspectBuilder *aspectBuilder in _aspectBuilders) {
        
        [aspectBuilder buildAspectForModel:managedObjectModel];
        
    }

    return managedObjectModel;
}

@end

NSManagedObjectModel *buildCoreDataModel(KPBNSManagedObjectModelAspectBuilder *builders, ...)
{
    KPBNSManagedObjectModelBuilder *builder = [KPBNSManagedObjectModelBuilder new];

    va_list arguments;
    va_start(arguments, builders);

    KPBNSManagedObjectModelAspectBuilder *aspectBuilder = builders;

    NSMutableArray *aspectBuilders = [NSMutableArray array];

    while (aspectBuilder) {
        aspectBuilder.managedObjectModelBuilder = builder;
        [aspectBuilders addObject:aspectBuilder];

        aspectBuilder = va_arg(arguments, KPBNSManagedObjectModelAspectBuilder *);
    }

    va_end(arguments);

    builder.aspectBuilders = aspectBuilders;

    return [builder buildModel];
}

KPBNSManagedObjectModelEntitiesBuilder *withEntities(KPBEntityBuilder *entities, ...)
{
    KPBNSManagedObjectModelEntitiesBuilder *builder = [KPBNSManagedObjectModelEntitiesBuilder new];
    
    va_list arguments;
    va_start(arguments, entities);
    
    KPBEntityBuilder *entityBuilder = entities;
    
    NSMutableArray *entityBuilders = [NSMutableArray array];
    
    while (entityBuilder) {
        [entityBuilders addObject:entityBuilder];
        entityBuilder = va_arg(arguments, KPBEntityBuilder *);
    }
    
    va_end(arguments);

    builder.entityBuilders = entityBuilders;
    
    return builder;
}

KPBNSManagedObjectModelRelationShipsBuilder *withRelationShips(KPBRelationShipBuilder *relationShips, ...)
{
    KPBNSManagedObjectModelRelationShipsBuilder *builder = [KPBNSManagedObjectModelRelationShipsBuilder new];

    va_list arguments;
    va_start(arguments, relationShips);

    KPBRelationShipBuilder *relationShipBuilder = relationShips;

    NSMutableArray *relationShipBuilders = [NSMutableArray array];

    while (relationShipBuilder) {
        [relationShipBuilders addObject:relationShipBuilder];
        relationShipBuilder = va_arg(arguments, KPBRelationShipBuilder *);
    }

    va_end(arguments);

    builder.relationShipBuilders = relationShipBuilders;

    return builder;
}