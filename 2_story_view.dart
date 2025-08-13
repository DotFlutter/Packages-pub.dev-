import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class StoryBar extends StatelessWidget {
  const StoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: UserStory.dummyUserStories.length,
        itemBuilder: (context, index) {
          return UserStoryTile(index: index);
        },
      ),
    );
  }
}

class UserStoryTile extends StatelessWidget {
  const UserStoryTile({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final UserStory userStory = UserStory.dummyUserStories[index];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: UserStoryAvatar(
            userStory: userStory,
            onTap: () {},
            // context.push(route: UserStoryPage.route(index)),
          ),
        ),
        SizedBox(
          width: 75,
          child: Text(
            userStory.owner.username,
            textAlign: TextAlign.center,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class UserStoryAvatar extends StatelessWidget {
  const UserStoryAvatar({
    super.key,
    required this.userStory,
    required this.onTap,
  });

  final UserStory userStory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.fromSize(
          size: const Size.square(65),
          child: const CircularProgressIndicator(value: 1, strokeWidth: 2),
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(userStory.owner.profileImage),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: theme.colorScheme.primary.withAlpha(50),
              borderRadius: BorderRadius.circular(100),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}


class Story {
  final String storyImage;
  final String caption;

  const Story({required this.storyImage, required this.caption});

  static List<Story> generateDummyStories() {
    return List.generate(Random().nextInt(6) + 1, (index) {
      final Faker faker = Faker();
      return Story(
        storyImage: faker.image.loremPicsum(
          random: Random().nextInt(10),
          height: 640,
          width: 360,
        ),
        caption: faker.lorem.sentence(),
      );
    });
  }
}

class UserStory {
  final User owner;
  final List<Story> stories;

  const UserStory({required this.owner, required this.stories});

  static List<UserStory> dummyUserStories = List.generate(
    User.dummyUsers.length,
    (index) {
      return UserStory(
        owner: User.dummyUsers[index],
        stories: Story.generateDummyStories(),
      );
    },
  );
}

class User {
  final String profileImage;
  final String bannerImage;
  final String username;
  final String fullname;
  final String bio;
  final int followersCount;
  final int followingCount;
  final bool isMe;

  const User({
    required this.profileImage,
    required this.bannerImage,
    required this.username,
    required this.fullname,
    required this.bio,
    required this.followersCount,
    required this.followingCount,
    this.isMe = false,
  });

  static final List<User> dummyUsers = List.generate(5, (index) {
    final Faker faker = Faker();
    return User(
      isMe: index == 0,
      profileImage: faker.image.loremPicsum(
        random: Random().nextInt(5),
        width: 640,
        height: 640,
      ),
      bannerImage: faker.image.loremPicsum(
        random: Random().nextInt(5),
        width: 640,
        height: 480,
      ),
      username: faker.internet.userName(),
      fullname: faker.person.name(),
      bio: faker.lorem.sentence(),
      followersCount: Random().nextInt(1000),
      followingCount: Random().nextInt(1000),
    );
  });
}

