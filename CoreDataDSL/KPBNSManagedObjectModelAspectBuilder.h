#import <Foundation/Foundation.h>

@class KPBNSManagedObjectModelBuilder;


@interface KPBNSManagedObjectModelAspectBuilder : NSObject

@property (nonatomic, weak) KPBNSManagedObjectModelBuilder *managedObjectModelBuilder;

/**
* This method is 'abstract' and must be implemented by subclasses. This method is used to build the specialized aspects of the managedObjectModel passed in.
*
* @param managedObjectModel The model to be build
*
*/
- (void)buildAspectForModel:(NSManagedObjectModel *)managedObjectModel;

@end