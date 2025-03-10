import ComposableArchitecture
import XCTest

@testable import ContactsApp

@MainActor
final class ContactsFeatureTests: XCTestCase {
  func testAddFlow() async {
    let store = TestStore(initialState: ContactsFeature.State()) {
      ContactsFeature.State()
    } withDependencies: {
      $0.uuid = .incrementing
    }

    await store.send(.addButtonTapped) {
      $0.destination = .addContact(
        AddContactFeature.State(
          Contact(id: ???, name: "")
        )
      )
    }
  }
}
