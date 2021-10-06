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
