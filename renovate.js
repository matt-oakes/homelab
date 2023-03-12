module.exports = {
    branchPrefix: 'renovate/',
    username: 'renovate-release',
    gitAuthor: 'Renovate Bot <bot@renovateapp.com>',
    onboarding: false,
    requireConfig: "optional",
    configMigration: true,
    platform: 'github',
    includeForks: true,
    repositories: [
      'matt-oakes/homelab',
    ],
    packageRules: [
      {
        description: 'lockFileMaintenance',
        matchUpdateTypes: [
          'pin',
          'digest',
          'patch',
          'minor',
          'major',
          'lockFileMaintenance',
        ],
        dependencyDashboardApproval: false,
        stabilityDays: 0,
      },
      {
        matchPackageNames: ["linuxserver/jellyfin"],
        allowedVersions: "<=1000.0.0"
      }
    ],
  };