//
//  PostsAPIServiceMock.swift
//  BreadfastTaskTests
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation
@testable import BreadfastTask

class PostsAPIServiceMock: PostsAPIServiceProtocol {

    var isFail = false

    let posts: [Post] = [
        Post(id: 0, userID: 153623, title: "Debeo qui est unde termes aer deficio dens.", body: "Volutabrum arcus tolero. Degusto cavus cupressus. Cupiditas cunctatio et. Carcer agnosco autus. Correptius torqueo victoria. Acidus sed cariosus. Quo depulso uterque. Tabgo recusandae patruus. Una trucido universe. Tabesco dolorem adhuc. Vesper abscido vulpes. Vox harum denuncio. Universe caelum provident. Adipisci altus despecto. Degero ager qui. Cubo cometes deprimo. Uberrime unde sto. Vereor cohibeo turpis. Vero non baiulus."),
        Post(id: 1, userID: 13453, title: "Acer et subito acies sed ipsam repudiandae.", body: "Thorax toties confido. Accusantium candidus stipes. Artificiose conventus aut. Speciosus suadeo aureus. Omnis causa admitto. Amplexus volva alias. Sortitus vigor denego. Desino demum credo. Utor acceptus aspicio. Ipsam terga deorsum. Omnis antepono curatio. Aut ancilla vis. Ceno alii possimus."),
        Post(id: 2, userID: 123563, title: "Claudeo expedita defleo cilicium alienus basium aufero caelum.", body: "Asperiores sto accommodo. Canto nobis claudeo. Officia quo bos. Tardus autem abstergo. Dolorum claudeo suggero. Defleo decet libero. Adduco denego cupressus. Cavus thesis vorax. Minima vulpes canis. Delectatio cometes ultra. Antea votum surculus. Suffoco molestiae cuius. Trucido velum thalassinus. Thermae cultura comitatus. Temperantia sit terga. Tristis amplexus una. Quia alo adsidue. Infit quidem demum. Solitudo abscido coruscus."),
        Post(id: 3, userID: 123533, title: "Caries adficio alias decipio careo.", body: "Aestus callide aggero. Tabella audentia stella. Sit solvo patrocinor. Apostolus cupressus trucido. Suasoria curvo abstergo. Solum admiratio crepusculum. Alias repellendus desolo. Tutamen amplus ventito. Ut abeo complectus. Depromo aufero ipsum. Et assumenda repellat. Delectus despirmatio accipio. Compello blandior unde. Occaecati decretum rerum. Creator combibo dapifer. Tamquam triduana quis. Vinco dolorem victus.")
    ]

    func getPosts(pageIndex: Int, completion: @escaping (Result<[BreadfastTask.Post], Error>) -> Void) {
        if isFail {
            completion(.failure(MockError.apiFailure))
        } else {
            completion(.success(posts))
        }
    }

    func getComments(postID: Int, completion: @escaping (Result<[BreadfastTask.Comment], Error>) -> Void) {

    }
}
