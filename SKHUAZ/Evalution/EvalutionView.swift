import SwiftUI

struct Lecture: Codable {
    let id: Int
    let lectureName: String
    let prfsName: String
    let classYear: Int
    let semester: Int
    let department: String
    let teamPlay: Int
    let task: Int
    let practice: Int
    let presentation: Int
    let nickname: String
    let review: String
    let user: String?
}


struct SaveLecture: Codable {
    let id: Int
    let lectureName: String
    let prfsName: String
    let classYear: Int
    let semester: Int
    let department: String
    let teamPlay: Int
    let task: Int
    let practice: Int
    let presentation: Int
    let review: String
    let userNickname: String
}



struct EvaluationView: View {
    
    //MARK: -
    @State private var resaveLecture: SaveLecture = SaveLecture(id: 0, lectureName: "", prfsName: "", classYear: 0, semester: 0, department: "", teamPlay: 0, task: 0, practice: 0, presentation: 0, review: "", userNickname: "")

    
    func getLecture(id: Int) {
        guard let url = URL(string: "http://skhuaz.duckdns.org/evaluations/\(id)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let lecture = try decoder.decode(SaveLecture.self, from: data)
                print("Received Lecture Data: \(lecture)")
                DispatchQueue.main.async {
                    self.resaveLecture = lecture // Store received data in resaveLecture
                    print("resaveLecture: \(self.resaveLecture)") // Print resaveLecture after receiving data
                    // 여기에서 resaveLecture 값을 확인할 수 있음
                }
            } catch let error {
                print("Decoding error: \(error.localizedDescription)")
            }

        }.resume()
    }

    

    //MARK: -
    
    @StateObject var api = PostAPI()
    
    @State var lectures: [Lecture] = []
    @State private var searchText: String = ""
    @State var test: String = ""
    //    @State var Evalution_write = false
    
    //    @Environment(\.presentationMode)
    var filteredLectures: [Lecture] {
        if searchText.isEmpty {
            return lectures
        } else {
            return lectures.filter { $0.department.contains(searchText) || $0.lectureName.contains(searchText) || $0.nickname.contains(searchText) || $0.prfsName.contains(searchText) }
        }
    }
    @State private var isDataFetched = false
    
    @State private var detail = false
    @State var secoundlectures: [secondLecture] = []
    @State var selectedLectureID: Int
    @State var isMoveViewPresented: Bool = false
    @State private var MoveReSave: Bool = false
    @State private var ReSaveShowAlert:Bool = false
    
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        GeometryReader { geometry in
            let maxWidth = geometry.size.width
            let maxHeight = geometry.size.height
            NavigationView{
                
                
                VStack {
                    /**검색창**/
                    HStack{
                        TextField("과목명/교수명/유저이름으 검색해주세요", text: $searchText)
                            .padding(.leading)
                            .frame(width: 300, height: 50)
                            .background(Color(.white))
                            .border(Color(hex: 0x9AC1D1),width: 5)
                            .cornerRadius(10)
                            .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                            .disableAutocorrection(true) // 자동완성 끄기
                        
                        Image("검색버튼")
                            .padding()
                            .frame(width: 50, height: 30)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    HStack{
                        Text("")
                            .frame(width:10)
                        ScrollView (.horizontal, showsIndicators: false, content:  {
                            HStack {
                                Button {
                                    searchText = "소프트웨어공학"
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(hex: 0x9AC1D1), lineWidth: 2)
                                        .frame(width:145,height:35)
                                    
                                        .overlay(
                                            Text("소프트웨어공학과")
                                        )
                                }
                                Button {
                                    searchText = "정보통신공학"
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(hex: 0x9AC1D1), lineWidth: 2)
                                        .frame(width:145,height:35)
                                    
                                        .overlay(
                                            Text("정보통신공학과")
                                        )
                                }
                                Button {
                                    searchText = "컴퓨터공학"
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(hex: 0x9AC1D1), lineWidth: 2)
                                        .frame(width:145,height:35)
                                    
                                        .overlay(
                                            Text("컴퓨터공학과")
                                        )
                                }
                                Button {
                                    searchText = "인공지능공학"
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(hex: 0x9AC1D1), lineWidth: 2)
                                        .frame(width:145,height:35)
                                    
                                        .overlay(
                                            Text("인공지능공학과")
                                        )
                                }
                            }.padding()
                        })
                        
                        write_button()
                        
                    }
                    
                    
                    //MARK: -
                    
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            ForEach(filteredLectures, id: \.id) { lecture in
                                Group {
                                    VStack {
                                        lectureNameView(for: lecture)
                                            .frame(width: 320, height: 40)
                                            .background(Color(uiColor: .secondarySystemBackground))
                                        
                                        chartView(for: lecture)
                                            .frame(width: 320, height: 90)
                                            .background(Color.white)
                                            .alignmentGuide(.leading, computeValue: { d in d[HorizontalAlignment.leading] })
                                        
                                        HStack {
                                            Text("작성자 : \(lecture.nickname)")
                                                .padding(.leading, 12)
                                                .font(.system(size: 12))
                                            Spacer()
                                            
                                            HStack {
                                                if userData.nickname == lecture.nickname {
                                                    Spacer()
                                                    /**삭제버튼**/
                                                    Button {
                                                        getLecture(id: lecture.id)
                                                        MoveReSave = true
    //                                                    selectedLectureID = lecture.id
    //                                                    if lecture.nickname == userData.nickname {
    //                                                        MoveReSave = true
    //                                                        getLecture(id: lecture.id)
    //                                                    } else {
    //                                                        MoveReSave = false
    //                                                        ReSaveShowAlert = true // alert를 띄우기 위한 변수 추가
    //                                                    }
                                                    } label: {
                                                        VStack {
                                                            Text("")
                                                                .frame(height:2)
                                                            Image(systemName: "square.and.pencil")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .padding(.bottom, 5)
                                                                .foregroundColor(Color(hex: 0xC28D8D))
                                                                .padding(.trailing, 15)
                                                                .frame(width: 40, height: 40)
                                                        }
                                                    }
                                                    .onTapGesture {
                                                        selectedLectureID = lecture.id
                                                        isMoveViewPresented = true // present될 view가 있음을 알리는 변수 값 변경
                                                    }
                                                    .sheet(isPresented: $MoveReSave, content: {
                                                        re_save(resaveLectures: resaveLecture, save_id: selectedLectureID)
                                                    })
    //
    //                                                .alert(isPresented: $ReSaveShowAlert, content: {
    //                                                    Alert(title: Text("수정 실패!"), message: Text("해당 글의 수정 접근 권한이 없습니다."), dismissButton: .default(Text("확인")))
    //                                                })
                                                    
                                                }
                                                else {
                                                    Text("")
                                                }
                                                
                                                
                                            }
                                            
                                            Button {
                                                selectedLectureID = lecture.id
                                                isMoveViewPresented = true // present될 view가 있음을 알리는 변수 값 변경
                                            } label: {
                                                Text("자세히")
                                                    .font(.system(size: 15))
                                            }
                                            .onTapGesture {
                                                selectedLectureID = lecture.id
                                                isMoveViewPresented = true // present될 view가 있음을 알리는 변수 값 변경
                                            }
                                            
                                            .sheet(isPresented: $isMoveViewPresented, content: {
                                                re_post(isMoveViewPresented: $isMoveViewPresented, post_id: selectedLectureID)
                                                //                                                deep_go(selectedLectureID: $selectedLectureID)
                                            })
                                        }
                                    }
                                    .padding()
                                    .frame(width: 350)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color(hex: 0x9AC1D1), lineWidth: 2))
                                }
                            }
                        }
                        .padding()
                    }
                    
                    
                    .padding(.bottom, 15)
                }
                .onAppear(perform: {
                    isDataFetched = true
                    fetchData()
                })
                .onChange(of: isDataFetched, perform: { value in
                    // Do something when isDataFetched changes, e.g. re-fetch data
                    fetchData()
                })
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func lectureNameView(for lecture: Lecture) -> some View {
        HStack{
            Text("\(lecture.lectureName) | \(lecture.prfsName) | \(Classyear_recover(num:lecture.classYear))년")
            Spacer()
        }
        .font(.system(size: 12))
        .padding()
    }
    
    func chartView(for lecture: Lecture) -> some View {
        HStack{
            VStack(alignment:.trailing, spacing: 8){
                Text("팀플횟수")
                Text("과제량")
                Text("실습량")
                Text("발표량")
            }
            .font(.system(size: 12))
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    Chart(num: lecture.teamPlay)
                    Spacer()
                }
                HStack(alignment: .center, spacing: 0) {
                    Chart(num: lecture.task)
                    Spacer()
                }
                HStack(alignment: .center, spacing: 0) {
                    Chart(num: lecture.practice)
                    Spacer()
                }
                HStack(alignment: .center, spacing: 0) {
                    Chart(num: lecture.presentation)
                    Spacer()
                }
            }
        }
    }
    
    //    func buttonsView(for lecture: Lecture) -> some View {
    //
    //        .font(.system(size: 12))
    //    }
    
    
    
    
    func fetchData() {
        guard let url = URL(string: "http://skhuaz.duckdns.org/AllEvaluation") else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    self.lectures = try decoder.decode([Lecture].self, from: data)
                } catch {
                    print("Failed to decode data: \(error.localizedDescription)")
                }
            }
            print(lectures)
        }
        isDataFetched = true
        dataTask.resume()
    }
    
    
    
    
    
    
    
    
    
    
    //func classyear , 제거
    func Classyear_recover(num:Int) -> String {
        var n = num.description.split(separator: ",")
        var s = ""
        for i in n {
            s+=i.description
        }
        return s
        
    }
    
    
    func Chart(num:Int) -> some View {
        var n = num
        if n == 1 {
            return AnyView(Rectangle()
                .frame(width: 52, height: 15)
                .foregroundColor(Color(hex: 0x9AC1D1)))
        }
        else if n == 2 {
            return AnyView(Rectangle()
                .frame(width: 104, height: 15)
                .foregroundColor(Color(hex: 0x9AC1D1)))
        }
        else if n == 3 {
            return AnyView(Rectangle()
                .frame(width: 156, height: 15)
                .foregroundColor(Color(hex: 0x9AC1D1)))
        }
        else if n == 4 {
            return AnyView(Rectangle()
                .frame(width: 208, height: 15)
                .foregroundColor(Color(hex: 0x9AC1D1)))
        }
        else if n == 5 {
            return AnyView(Rectangle()
                .frame(width: 250, height: 15)
                .foregroundColor(Color(hex: 0x9AC1D1)))
        }
        
        // 기본값 반환
        return AnyView(Rectangle()
                       //            .frame(width: 52, height: 15)
                       //            .foregroundColor(Color(hex: 0x9AC1D1)))
        )
    }
    
}



