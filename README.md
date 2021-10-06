# TargetExample

An example illustrating issues where dynamic frameworks can not depend on static frameworks

# Reproduction Steps

* Clone the repository
* Run `pod spec lint`

		TargetExample$ pod spec lint          

		 -> AdobeManager (1.0)
		    - WARN  | source: Git SSH URLs will NOT work for people behind firewalls configured to only allow HTTP, therefore HTTPS is preferred.
		    - ERROR | [iOS] unknown: Encountered an unknown error (The 'Pods-App' target has transitive dependencies that include statically linked binaries: (AEPMobileServices)) during validation.

		Analyzed 1 podspec.

# Attempted workaround

There is a way to repackage static library as a dynamic library using cocoapods. This approach is very "hacky" and highly depends on how static libary was built. 

Even though AEPMobileSerivces_Forked pod is passing validation if we try to use it in the AdobeManager pod and embed it in the app it will fail to run simulator, and might have other issue.

        $ pod spec lint --allow-warnings

         -> AEPMobileServices_Forked (3.0.1)
            - WARN  | [iOS] vendored_libraries: `libAEPMobileServices_iOS.a` does not match the expected static library name format `lib[name].a`
            - NOTE  | xcodebuild:  note: Using new build system
            - NOTE  | xcodebuild:  note: Building targets in parallel
            - NOTE  | xcodebuild:  note: Using codesigning identity override: -
            - NOTE  | xcodebuild:  note: Build preparation complete
            - NOTE  | [iOS] xcodebuild:  note: Planning build
            - NOTE  | [iOS] xcodebuild:  note: Analyzing workspace
            - NOTE  | [iOS] xcodebuild:  note: Constructing build description
            - NOTE  | [iOS] xcodebuild:  warning: Skipping code signing because the target does not have an Info.plist file and one is not being generated automatically. (in target 'App' from project 'App')

        Analyzed 1 podspec.

        AEPMobileServices_Forked.podspec passed validation.

This approach has multiplle downsides:

* We have to maintain own version of the Podspec
* We loose ability to receive updates
* The process if very fragile and depends on the way vendor ships their library 
* In this particular case I couldn't get it to work for every architecutre 
