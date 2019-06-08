# GitHubSearch

# Theme
RxSwiftを使用してGitHubのレポジトリを検索してみる

# 使用ライブラリ
今回は全て、cocoapodsで入れている
- RxSwift
- RxCocoa
- R.Swift
- APIKit

# その他使用したもの
- giboを使用しgitignoreを作成
- SwiftLint入れていない(余裕があったら使用してみたい)

# GitHubSearchのJSONについて
簡単に帰ってくるJSONのモデルを追加しておく。
```
{
  "total_count": 1,
  "incomplete_results": false,
  "items": [
    {
      "id": 161903574,
      "node_id": "MDEwOlJlcG9zaXRvcnkxNjE5MDM1NzQ=",
      "name": "Guruppu",
      "full_name": "tosh7/Guruppu",
      "private": false,
      "owner": {
        "login": "tosh7",
        "id": 27297319,
        "node_id": "MDQ6VXNlcjI3Mjk3MzE5",
        "avatar_url": "https://avatars2.githubusercontent.com/u/27297319?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/tosh7",
        "html_url": "https://github.com/tosh7",
        "followers_url": "https://api.github.com/users/tosh7/followers",
        "following_url": "https://api.github.com/users/tosh7/following{/other_user}",
        "gists_url": "https://api.github.com/users/tosh7/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/tosh7/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/tosh7/subscriptions",
        "organizations_url": "https://api.github.com/users/tosh7/orgs",
        "repos_url": "https://api.github.com/users/tosh7/repos",
        "events_url": "https://api.github.com/users/tosh7/events{/privacy}",
        "received_events_url": "https://api.github.com/users/tosh7/received_events",
        "type": "User",
        "site_admin": false
      },
      "html_url": "https://github.com/tosh7/Guruppu",
      "description": "あなたのグルメをみんなで共有(制作途中)",
      "fork": false,
      "url": "https://api.github.com/repos/tosh7/Guruppu",
      "forks_url": "https://api.github.com/repos/tosh7/Guruppu/forks",
      "keys_url": "https://api.github.com/repos/tosh7/Guruppu/keys{/key_id}",
      "collaborators_url": "https://api.github.com/repos/tosh7/Guruppu/collaborators{/collaborator}",
      "teams_url": "https://api.github.com/repos/tosh7/Guruppu/teams",
      "hooks_url": "https://api.github.com/repos/tosh7/Guruppu/hooks",
      "issue_events_url": "https://api.github.com/repos/tosh7/Guruppu/issues/events{/number}",
      "events_url": "https://api.github.com/repos/tosh7/Guruppu/events",
      "assignees_url": "https://api.github.com/repos/tosh7/Guruppu/assignees{/user}",
      "branches_url": "https://api.github.com/repos/tosh7/Guruppu/branches{/branch}",
      "tags_url": "https://api.github.com/repos/tosh7/Guruppu/tags",
      "blobs_url": "https://api.github.com/repos/tosh7/Guruppu/git/blobs{/sha}",
      "git_tags_url": "https://api.github.com/repos/tosh7/Guruppu/git/tags{/sha}",
      "git_refs_url": "https://api.github.com/repos/tosh7/Guruppu/git/refs{/sha}",
      "trees_url": "https://api.github.com/repos/tosh7/Guruppu/git/trees{/sha}",
      "statuses_url": "https://api.github.com/repos/tosh7/Guruppu/statuses/{sha}",
      "languages_url": "https://api.github.com/repos/tosh7/Guruppu/languages",
      "stargazers_url": "https://api.github.com/repos/tosh7/Guruppu/stargazers",
      "contributors_url": "https://api.github.com/repos/tosh7/Guruppu/contributors",
      "subscribers_url": "https://api.github.com/repos/tosh7/Guruppu/subscribers",
      "subscription_url": "https://api.github.com/repos/tosh7/Guruppu/subscription",
      "commits_url": "https://api.github.com/repos/tosh7/Guruppu/commits{/sha}",
      "git_commits_url": "https://api.github.com/repos/tosh7/Guruppu/git/commits{/sha}",
      "comments_url": "https://api.github.com/repos/tosh7/Guruppu/comments{/number}",
      "issue_comment_url": "https://api.github.com/repos/tosh7/Guruppu/issues/comments{/number}",
      "contents_url": "https://api.github.com/repos/tosh7/Guruppu/contents/{+path}",
      "compare_url": "https://api.github.com/repos/tosh7/Guruppu/compare/{base}...{head}",
      "merges_url": "https://api.github.com/repos/tosh7/Guruppu/merges",
      "archive_url": "https://api.github.com/repos/tosh7/Guruppu/{archive_format}{/ref}",
      "downloads_url": "https://api.github.com/repos/tosh7/Guruppu/downloads",
      "issues_url": "https://api.github.com/repos/tosh7/Guruppu/issues{/number}",
      "pulls_url": "https://api.github.com/repos/tosh7/Guruppu/pulls{/number}",
      "milestones_url": "https://api.github.com/repos/tosh7/Guruppu/milestones{/number}",
      "notifications_url": "https://api.github.com/repos/tosh7/Guruppu/notifications{?since,all,participating}",
      "labels_url": "https://api.github.com/repos/tosh7/Guruppu/labels{/name}",
      "releases_url": "https://api.github.com/repos/tosh7/Guruppu/releases{/id}",
      "deployments_url": "https://api.github.com/repos/tosh7/Guruppu/deployments",
      "created_at": "2018-12-15T12:37:14Z",
      "updated_at": "2019-05-14T05:24:05Z",
      "pushed_at": "2019-05-14T05:24:03Z",
      "git_url": "git://github.com/tosh7/Guruppu.git",
      "ssh_url": "git@github.com:tosh7/Guruppu.git",
      "clone_url": "https://github.com/tosh7/Guruppu.git",
      "svn_url": "https://github.com/tosh7/Guruppu",
      "homepage": "",
      "size": 138885,
      "stargazers_count": 1,
      "watchers_count": 1,
      "language": "Swift",
      "has_issues": true,
      "has_projects": true,
      "has_downloads": true,
      "has_wiki": true,
      "has_pages": false,
      "forks_count": 0,
      "mirror_url": null,
      "archived": false,
      "disabled": false,
      "open_issues_count": 6,
      "license": null,
      "forks": 0,
      "open_issues": 6,
      "watchers": 1,
      "default_branch": "master",
      "score": 20.362059
    }
  ]
}
```

# 参考にした記事
https://qiita.com/sgr-ksmt/items/e822a379d41462e05e0d
