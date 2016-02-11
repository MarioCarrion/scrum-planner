# gitlab-botherer

**gitlab-botherer** is a program in charge of *bothering* team members in a Gitlab group when a Merge Request has been sitting for too long.

It uses slack as the default way for bothering people.

## Initial Scope

The following are the basic to consider this project *production ready*:

### Configuration File

It reads from a configuration file. Using YAML as *de-facto* format. This file must include the following options:

1. Gitlab
  1. Private API token
  2. Group
2. Slack
  1. Channel 
  2. User name mapping
3. Maximum Waiting Time, in hours.

For example a valid configuration file would be:

```
default: &default
  gitlab:
    token: 'abcdefgh'
    group: 'developers'
  slack:
    channel: 'backend'
    users:
      mario: 'mario-carrion'
      jdoe: 'john-doe'
  maximum_waiting_time: 5
```

### Gitlab API

Caching the Gitlab IDs locally is ideal, so the following would be required:

1. (Not the best solution but enough for the first version) A program for saving a user-based preferences file that contains the mapping for:
   1. Group
   2. Users
   3. Projects
2. A way for interacting with the Gitlab API, a simple HTTP Get class should be enough.

### Slack API

1. A way for communicating with Slack to properly *bother* the users.
