import UIKit
import AvitoNavigation

final class ApplicationRouterIpad: BaseDemoRouter, ApplicationRouter {
    // MARK: - ApplicationRouter
    func showAuthorziation(moduleOutput moduleOutput: AuthorizationModuleOutput) {
        let animator = ModalNavigationTransitionsAnimator()
        animator.targetModalPresentationStyle = .FormSheet
        
        presentModalNavigationControllerWithRootViewControllerDerivedFrom( { (routerSeed) -> UIViewController in

            let authorizationAssembly = assemblyFactory.authorizationAssembly()
            
            let viewController = authorizationAssembly.module(
                routerSeed: routerSeed,
                moduleOutput: moduleOutput
            )
            
            return viewController
        }, animator: animator)
    }
    
    func showCategories() {
        pushViewControllerDerivedFrom { routerSeed -> UIViewController in
            let subCategoriesAssembly = assemblyFactory.categoriesAssembly()
            
            let viewController = subCategoriesAssembly.ipadModule(
                routerSeed: routerSeed
            )
            
            return viewController
        }
    }
    
    func showRecursion() {
        pushViewControllerDerivedFrom { routerSeed -> UIViewController in
            let recursionAssembly = assemblyFactory.recursionAssembly()
            
            let viewController = recursionAssembly.ipadModule(routerSeed: routerSeed)
            
            return viewController
        }
    }
}