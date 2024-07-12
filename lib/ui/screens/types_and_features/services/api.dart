import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import '../models/types_and_features_model.dart';

class ApiService {
  Future<String> fetchSecondParagraph(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var paragraphs = document.querySelectorAll('p');
        if (paragraphs.length >= 2) {
          return paragraphs[1].text;
        } else {
          return 'Second paragraph not found';
        }
      } else {
        return 'Failed to load page: ${response.statusCode}';
      }
    } catch (e) {
      return 'Failed to fetch page: $e';
    }
  }

  Future<Map<String, String>> fetchImageAndDescription(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var imageElement = document.querySelector('.gallerysection img');
        var descriptionElements = document.querySelectorAll('.gallerysection p');
        var descriptionElement = descriptionElements.length > 1 ? descriptionElements[1] : null;
        if (imageElement != null && descriptionElement != null) {
          return {
            'image': 'https://volcano.si.edu' + imageElement.attributes['src']!,
            'description': descriptionElement.text.trim(),
          };
        } else {
          return {'image': '', 'description': 'Description not found'};
        }
      } else {
        return {'image': '', 'description': 'Failed to load page: ${response.statusCode}'};
      }
    } catch (e) {
      return {'image': '', 'description': 'Failed to fetch page: $e'};
    }
  }

  Future<List<TypesAndFeaturesModel>> fetchVolcanoTypes() async {
    try {
      final Uri url = Uri.parse('https://volcano.si.edu/gallery/ImageCollection.cfm?subject=VolType');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var items = document.querySelectorAll('.gallerysection .linkButton-Gallery3');
        List<TypesAndFeaturesModel> volcanoTypes = [];

        Map<String, String> volcanoLinks = {
          'Stratovolcanoes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeStrato',
          'Shield Volcanoes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeShield',
          'Calderas': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeCalderas',
          'Craters': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeCraters',
          'Fissure Vents': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeFissures',
          'Scoria Cones': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeScoria',
          'Lava Domes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeLavaDomes',
          'Submarine Volcanoes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeSubmarine',
          'Geothermal Features': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeGeothermal',
          'Maars': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeMaar',
          'Volcanic Fields': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeVolcField',
        };

        for (var item in items) {
          var linkElement = item.querySelector('a');
          var imageElement = item.querySelector('img');
          if (linkElement != null && imageElement != null) {
            String name = item.text.trim().split('\n').last.trim();
            String image = 'https://volcano.si.edu' + imageElement.attributes['src']!;
            String subtitle = '';
            if (volcanoLinks.containsKey(name)) {
              subtitle = await fetchSecondParagraph(volcanoLinks[name]!);
            }
            volcanoTypes.add(TypesAndFeaturesModel(
              name: name,
              image: image,
              subtitle: subtitle,
              image_1: '',
              image_2: '',
              image_3: '',
              description_1: '',
              description_2: '',
              description_3: '',
            ));
          }
        }
        return volcanoTypes;
      } else {
        throw Exception('Failed to load volcano types: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<TypesAndFeaturesModel> fetchVolcanoDetails(TypesAndFeaturesModel model, String url) async {
    try {
      String subtitle = await fetchSecondParagraph(url);

      Map<String, List<String>> volcanoImageLinks = {
        'Stratovolcanoes': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02059',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-05294',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-05231'
        ],
        'Shield Volcanoes': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-03574',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-04727',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-09909'
        ],
        'Calderas': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-10102',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-05348',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-05305'
        ],
        'Craters': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-03618',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-09629',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-10089'
        ],
        'Fissure Vents': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-11582',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02409',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-03509'
        ],
        'Scoria Cones': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-10962',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-07346',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-01704'
        ],
        'Lava Domes': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-03837',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02928',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-01949'
        ],
        'Submarine Volcanoes': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-11887',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02098',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02095'
        ],
        'Geothermal Features': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-03359',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-12837',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02384'
        ],
        'Maars': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-02116',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-00459',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-00755'
        ],
        'Volcanic Fields': [
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-04141',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-11905',
          'https://volcano.si.edu/gallery/ShowImage.cfm?photo=GVP-03623'
        ],
      };

      List<String> images = ['', '', ''];
      List<String> descriptions = ['', '', ''];

      if (volcanoImageLinks.containsKey(model.name)) {
        for (int i = 0; i < 3; i++) {
          var data = await fetchImageAndDescription(volcanoImageLinks[model.name]![i]);
          images[i] = data['image']!;
          descriptions[i] = data['description']!;
        }
      }

      return model.copyWith(
        subtitle: subtitle,
        image_1: images[0],
        description_1: descriptions[0],
        image_2: images[1],
        description_2: descriptions[1],
        image_3: images[2],
        description_3: descriptions[2],
      );
    } catch (e) {
      throw Exception('Failed to fetch details: $e');
    }
  }
}
