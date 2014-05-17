//
//  CoreDataDSLTests.m
//  CoreDataDSLTests
//
//  Created by Karl on 17/05/14.
//  Copyright (c) 2014 Karl Bode. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "CoreDataDSL.h"

SPEC_BEGIN(CoreDataDSLSpec)

    describe(@"The Model", ^{

        it(@"should a return a valid NSManagedObjectModel", ^{

            static NSString *BookEntityName = @"Book";
            static NSString *PageEntityName = @"Page";
            static NSString *TitleAttributeName = @"title";

            NSManagedObjectModel *model = buildCoreDataModel(

                    withEntities(

                            Entity(BookEntityName).withAttributes(
                                    Attribute(TitleAttributeName).withType(NSStringAttributeType), nil
                            ),
                            Entity(PageEntityName),
                            nil),

                    withRelationShips(
                            RelationShip().from(BookEntityName).to(PageEntityName)
                    ),

                    nil
            );

            [[model shouldNot] beNil];
            [[model.entities should] haveCountOf:2];

            NSEntityDescription *bookEntityDescription = model.entitiesByName[BookEntityName];
            [[bookEntityDescription shouldNot] beNil];

            NSAttributeDescription *titleAttributeDescription = bookEntityDescription.attributesByName[TitleAttributeName];
            [[titleAttributeDescription shouldNot] beNil];
            [[theValue(titleAttributeDescription.attributeType) should] equal:theValue(NSStringAttributeType)];

        });

    });

SPEC_END

