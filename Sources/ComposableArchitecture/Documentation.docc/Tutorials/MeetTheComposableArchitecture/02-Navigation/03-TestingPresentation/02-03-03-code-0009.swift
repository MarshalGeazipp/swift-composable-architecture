import ComposableArchitecture
import XCTest

@testable import ContactsApp

@MainActor
final class ContactsFeatureTests: XCTestCase {
  func testDeleteContact() async {
    let store = TestStore(
      initialState: ContactsFeature.State(
        contacts: [
          Contact(id: UUID(0), name: "Blob"),
          Contact(id: UUID(1), name: "Blob Jr."),
        ]
      )
    ) {
      ContactsFeature()
    }

    await store.send(.deleteButtonTapped(id: UUID(1))) {
      state.destination = .alert(.deleteConfirmation(id: id))
    }
    await store.send(.destination(.presented(.alert(.confirmDeletion(id: UUID(1)))))) {
    }
  }
}
