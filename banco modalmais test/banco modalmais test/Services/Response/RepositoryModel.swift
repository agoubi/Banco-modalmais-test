//
//  RepositoryModel.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

struct RepositoryModel: Codable {
    
    var id: Int?
    var node_id: String?
    var name: String?
    var full_name: String?
    var isPrivate:Bool?
    var owner:Owner?
    var html_url: String?
    var description: String?
    var fork: Bool?
    var url: String?
    var forks_url: String?
    var keys_url: String?
    var collaborators_url: String?
    var teams_url: String?
    var hooks_url: String?
    var issue_events_url: String?
    var events_url: String?
    var assignees_url: String?
    var branches_url: String?
    var tags_url: String?
    var blobs_url: String?
    var git_tags_url: String?
    var git_refs_url: String?
    var trees_url: String?
    var statuses_url: String?
    var languages_url: String?
    var stargazers_url: String?
    var contributors_url: String?
    var subscribers_url: String?
    var subscription_url: String?
    var commits_url: String?
    var git_commits_url: String?
    var comments_url: String?
    var issue_comment_url: String?
    var contents_url: String?
    var compare_url: String?
    var merges_url: String?
    var archive_url: String?
    var downloads_url: String?
    var issues_url: String?
    var pulls_url: String?
    var milestones_url: String?
    var notifications_url: String?
    var labels_url: String?
    var releases_url: String?
    var deployments_url: String?
    var created_at: String?
    var updated_at: String?
    var pushed_at: String?
    var git_url: String?
    var ssh_url: String?
    var clone_url: String?
    var svn_url: String?
    var homepage: String?
    var size: Int?
    var stargazers_count: Int?
    var watchers_count: Int?
    var language: String?
    var has_issues: Bool?
    var has_projects: Bool?
    var has_downloads: Bool?
    var has_wiki: Bool?
    var has_pages: Bool?
    var forks_count: Int?
    var mirror_url: String?
    var archived: Bool?
    var disabled: Bool?
    var open_issues_count: Int?
    var license: License?
    var forks: Int?
    var open_issues: Int?
    var watchers: Int?
    var default_branch: String?
    var score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case node_id = "node_id"
        case name = "name"
        case full_name = "full_name"
        case isPrivate = "private"
        case owner = "owner"
        case html_url = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case forks_url = "forks_url"
        case keys_url = "keys_url"
        case collaborators_url = "collaborators_url"
        case teams_url = "teams_url"
        case hooks_url = "hooks_url"
        case issue_events_url = "issue_events_url"
        case events_url = "events_url"
        case assignees_url = "assignees_url"
        case branches_url = "branches_url"
        case tags_url = "tags_url"
        case blobs_url = "blobs_url"
        case git_tags_url = "git_tags_url"
        case git_refs_url = "git_refs_url"
        case trees_url = "trees_url"
        case statuses_url = "statuses_url"
        case languages_url = "languages_url"
        case stargazers_url = "stargazers_url"
        case contributors_url = "contributors_url"
        case subscribers_url = "subscribers_url"
        case subscription_url = "subscription_url"
        case commits_url = "commits_url"
        case git_commits_url = "git_commits_url"
        case comments_url = "comments_url"
        case issue_comment_url = "issue_comment_url"
        case contents_url = "contents_url"
        case compare_url = "compare_url"
        case merges_url = "merges_url"
        case archive_url = "archive_url"
        case downloads_url = "downloads_url"
        case issues_url = "issues_url"
        case pulls_url = "pulls_url"
        case milestones_url = "milestones_url"
        case notifications_url = "notifications_url"
        case labels_url = "labels_url"
        case releases_url = "releases_url"
        case deployments_url = "deployments_url"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case pushed_at = "pushed_at"
        case git_url = "git_url"
        case ssh_url = "ssh_url"
        case clone_url = "clone_url"
        case svn_url = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazers_count = "stargazers_count"
        case watchers_count = "watchers_count"
        case language = "language"
        case has_issues = "has_issues"
        case has_projects = "has_projects"
        case has_downloads = "has_downloads"
        case has_wiki = "has_wiki"
        case has_pages = "has_pages"
        case forks_count = "forks_coun"
        case mirror_url = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case open_issues_count = "open_issues_count"
        case license = "license"
        case forks = "forks"
        case open_issues = "open_issues"
        case watchers = "watchers"
        case default_branch = "default_branch"
        case score = "score"
    }
    
}
