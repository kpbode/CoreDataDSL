#import "KPBEntityBuilder.h"
#import "KPBAttributeBuilder.h"


@interface KPBEntityBuilder ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSArray *attributeBuilders;
@property (nonatomic, copy) NSString *parentEntityName;
@end

@implementation KPBEntityBuilder

+ (instancetype)builderWithName:(NSString *)name
{
    KPBEntityBuilder *entityBuilder = [KPBEntityBuilder new];
    entityBuilder.name = name;

    return entityBuilder;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;

    [self setupBlocks];

    return self;
}

- (void)setupBlocks
{

    __block KPBEntityBuilder *blockSelf = self;
    
    self.withParentEntity = ^KPBEntityBuilder *(NSString *parentEntityName) {
        
        blockSelf.parentEntityName = parentEntityName;
        
        return blockSelf;
    };

    self.withAttributes = ^KPBEntityBuilder *(KPBAttributeBuilder *attributes, ...) {

        va_list arguments;
        va_start(arguments, attributes);

        KPBAttributeBuilder *attributeBuilder = attributes;

        NSMutableArray *attributeBuilders = [NSMutableArray array];

        while (attributeBuilder) {

            [attributeBuilders addObject:attributeBuilder];

            attributeBuilder = va_arg(arguments, KPBAttributeBuilder *);
        }

        va_end(arguments);

        blockSelf.attributeBuilders = attributeBuilders;

        return blockSelf;
    };

}

- (NSEntityDescription *)buildEntityDescriptionForModel:(NSManagedObjectModel *)managedObjectModel
{
    NSEntityDescription *entityDescription = [NSEntityDescription new];
    entityDescription.name = _name;
    entityDescription.properties = @[];

    if (_parentEntityName) {

        NSEntityDescription *parentEntityDescription = managedObjectModel.entitiesByName[_parentEntityName];
        parentEntityDescription.subentities = [parentEntityDescription.subentities arrayByAddingObject:entityDescription];

    }

    NSMutableArray *attributeDescriptions = [NSMutableArray array];

    for (KPBAttributeBuilder *attributeBuilder in _attributeBuilders) {

        [attributeBuilder buildAttributeDescriptionForEntity:entityDescription];

    }

    managedObjectModel.entities = [managedObjectModel.entities arrayByAddingObject:entityDescription];

    return entityDescription;
}

@end

KPBEntityBuilder *Entity(NSString *name)
{
    return [KPBEntityBuilder builderWithName:name];
}