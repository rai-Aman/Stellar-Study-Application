import 'package:flutter/material.dart';

import 'PodcastDetailPage.dart';

class PodcastsPage extends StatefulWidget {
  const PodcastsPage({super.key});

  @override
  _PodcastsPageState createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  final List<Podcast> _podcasts = [
    Podcast(
      title: 'The Joe Rogan Experience',
      image: 'loginRegisterImages/fantasy.jpg',
      description:
          'The Joe Rogan Experience is a free audio and video podcast hosted by American comedian, actor, sports commentator, and television host Joe Rogan.',
      link:
          'https://www.youtube.com/watch?v=OWlKZ6C7cDY&list=RDMM&start_radio=1&rv=_fqpk3cXG-U',
    ),
    Podcast(
      title: 'Serial',
      image: 'https://i1.sndcdn.com/artworks-000299618318-jjg0jr-t500x500.jpg',
      description:
          'Serial is a podcast from the creators of This American Life, hosted by Sarah Koenig. Serial tells one story — a true story — over the course of a season.',
      link:
          'https://www.youtube.com/watch?v=OWlKZ6C7cDY&list=RDMM&start_radio=1&rv=_fqpk3cXG-U',
    ),
    Podcast(
      title: 'Radiolab',
      image: 'https://i1.sndcdn.com/artworks-000231180491-zp76zk-t500x500.jpg',
      description:
          'Radiolab is a show about curiosity. Where sound illuminates ideas, and the boundaries blur between science, philosophy, and human experience.',
      link:
          'https://www.youtube.com/watch?v=OWlKZ6C7cDY&list=RDMM&start_radio=1&rv=_fqpk3cXG-U',
    ),
    Podcast(
      title: 'Stuff You Should Know',
      image: 'https://i1.sndcdn.com/avatars-000173668293-3d01sb-t500x500.jpg',
      description:
          'How do landfills work? How do mosquitos work? Join Josh and Chuck as they explore the Stuff You Should Know about everything from genes to the Galapagos in this podcast from HowStuffWorks.com.',
      link:
          'https://www.youtube.com/watch?v=OWlKZ6C7cDY&list=RDMM&start_radio=1&rv=_fqpk3cXG-U',
    ),
    Podcast(
      title: 'The Daily',
      image: 'https://i1.sndcdn.com/avatars-000287496484-puox7g-t500x500.jpg',
      description:
          'This is what the news should sound like. The biggest stories of our time, told by the best journalists in the world. Hosted by Michael Barbaro. Twenty minutes a day, five days a week, ready by 6 a.m.',
      link:
          'https://www.youtube.com/watch?v=OWlKZ6C7cDY&list=RDMM&start_radio=1&rv=_fqpk3cXG-U',
    ),
    Podcast(
      title: 'Planet Money',
      image: 'https://i1.sndcdn.com/artworks-000051513174-ll76ja-t500x500.jpg',
      description:
          'The economy explained. Imagine you could call up a friend and say, "Meet me at the bar and tell me what\'s going on with the economy." Now imagine that\'s actually a fun evening.',
      link:
          'https://www.youtube.com/watch?v=OWlKZ6C7cDY&list=RDMM&start_radio=1&rv=_fqpk3cXG-U',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 38, 2, 56),
        elevation: 0,
        title: Text('Podcasts'),
      ),
      body: ListView.builder(
        itemCount: _podcasts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PodcastDetailPage(podcast: _podcasts[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 38, 2, 56),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_podcasts[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _podcasts[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 2, 56),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          _podcasts[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
