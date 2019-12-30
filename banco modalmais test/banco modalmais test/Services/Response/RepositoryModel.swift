//
//  RepositoryModel.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

public struct RepositoryModel: Codable {
    
    public var id: Int?
    public var node_id: String?
    public var name: String?
    public var full_name: String?
    public var isPrivate:Bool?
    public var owner:Owner?
    public var html_url: String?
    public var description: String?
    public var fork: Bool?
    public var url: String?
    public var forks_url: String?
    public var keys_url: String?
    public var collaborators_url: String?
    public var teams_url: String?
    public var hooks_url: String?
    public var issue_events_url: String?
    public var events_url: String?
    public var assignees_url: String?
    public var branches_url: String?
    public var tags_url: String?
    public var blobs_url: String?
    public var git_tags_url: String?
    public var git_refs_url: String?
    public var trees_url: String?
    public var statuses_url: String?
    public var languages_url: String?
    public var stargazers_url: String?
    public var contributors_url: String?
    public var subscribers_url: String?
    public var subscription_url: String?
    public var commits_url: String?
    public var git_commits_url: String?
    public var comments_url: String?
    public var issue_comment_url: String?
    public var contents_url: String?
    public var compare_url: String?
    public var merges_url: String?
    public var archive_url: String?
    public var downloads_url: String?
    public var issues_url: String?
    public var pulls_url: String?
    public var milestones_url: String?
    public var notifications_url: String?
    public var labels_url: String?
    public var releases_url: String?
    public var deployments_url: String?
    public var created_at: String?
    public var updated_at: String?
    public var pushed_at: String?
    public var git_url: String?
    public var ssh_url: String?
    public var clone_url: String?
    public var svn_url: String?
    public var homepage: String?
    public var size: Int?
    public var stargazers_count: Int?
    public var watchers_count: Int?
    public var language: String?
    public var has_issues: Bool?
    public var has_projects: Bool?
    public var has_downloads: Bool?
    public var has_wiki: Bool?
    public var has_pages: Bool?
    public var forks_count: Int?
    public var mirror_url: String?
    public var archived: Bool?
    public var disabled: Bool?
    public var open_issues_count: Int?
    public var license: License?
    public var forks: Int?
    public var open_issues: Int?
    public var watchers: Int?
    public var default_branch: String?
    public var score: Double?
    
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
