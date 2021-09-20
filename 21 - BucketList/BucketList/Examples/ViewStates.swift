//
//  ViewStates.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI

enum LoadingState {
	case loading, success, failed
}

struct LoadingView: View {
	 var body: some View {
		  Text("Loading...")
	 }
}

struct SuccessView: View {
	 var body: some View {
		  Text("Success!")
	 }
}

struct FailedView: View {
	 var body: some View {
		  Text("Failed.")
	 }
}



struct ViewStates: View {
	var loadingState = LoadingState.loading
    var body: some View {
		Group {
			 if loadingState == .loading {
				  LoadingView()
			 } else if loadingState == .success {
				  SuccessView()
			 } else if loadingState == .failed {
				  FailedView()
			 }
		}
    }
}

struct ViewStates_Previews: PreviewProvider {
    static var previews: some View {
        ViewStates()
    }
}
