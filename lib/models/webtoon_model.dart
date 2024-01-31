class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : // #named constructors 에대해 공부할 필요 있음, ':'를 사용하는 이유는 클래스를 초기화
        title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
