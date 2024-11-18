

import Foundation

public protocol UserListUsecaseProtocol {
    func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError> //유저 리스트 불러오기 (원격)
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> //전체 즐겨찾기 리스트 불러오기
    func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
}

public struct UserListUsecase: UserListUsecaseProtocol {
    private let repository: UserRepositoryProtocol
    
    public init(respository: UserRepositoryProtocol) {
        self.repository = respository
    }
    
    public func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError> {
        await repository.fetchUser(query: query, page: page)
    }
    
    public func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        repository.getFavoriteUsers()
    }
    
    public func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError> {
        repository.saveFavoriteUser(user: user)
    }
    
    public func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError> {
        repository.deleteFavoriteUser(userID: userID)
    }
    
}
