//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func createItemCoordinator() -> Coordinator {
        return createItemCoordinator(navController: nil)
    }
    
    func createItemCoordinator(navController navController: UINavigationController?) -> Coordinator {
        let coordinator = ItemCoordinator(router: router(navController),
                                          factory: ControllersFactoryImp(),
                                          coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func createSettingsCoordinator() -> Coordinator {
        return createSettingsCoordinator(navController: nil)
    }
    
    func createSettingsCoordinator(navController navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = SettingsCoordinator(router: router(navController),
                                              factory: ControllersFactoryImp())
        return coordinator
    }
    
    func createItemCreationCoordinatorBox() ->
        (coordinator: Coordinator,
         output: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            
            return createItemCreationCoordinatorBox(navController: nil)
    }
    func createItemCreationCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (coordinator: Coordinator,
        output: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            
            let router = self.router(navController)
            let coordinator = ItemCreateCoordinator(router: router,
                                                    factory: ControllersFactoryImp())
            return (coordinator, coordinator, router.rootController)
    }
    
    func createAuthCoordinatorBox() ->
        (coordinator: Coordinator,
        output: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            
            return createAuthCoordinatorBox(navController: nil)
    }
    
    func createAuthCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (coordinator: Coordinator,
        output: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            let router = self.router(navController)
            let coordinator = AuthCoordinator(router: router,
                                              factory: ControllersFactoryImp())
            return (coordinator, coordinator, router.rootController)
    }
    
    private func router(navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(navController: UINavigationController?) -> UINavigationController {
        
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.Main) }
    }
}