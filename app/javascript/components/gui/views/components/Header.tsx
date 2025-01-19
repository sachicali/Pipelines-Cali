import React from 'react'
import { FaChartLine, FaBell, FaLightbulb, FaUserCircle } from 'react-icons/fa'

const Header: React.FC = () => {
  try {
    return (
      <header className="glass-effect sticky top-0 z-50 border-b border-purple-900/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-20">
            <div className="flex items-center space-x-4">
              <div className="text-2xl font-bold gradient-text">
                Pipelines
              </div>
            </div>

            <nav className="hidden md:flex items-center space-x-8">
              <a
                href="/"
                className="flex items-center space-x-2 text-purple-300 hover:text-white transition-colors"
              >
                <FaChartLine className="w-5 h-5" />
                <span>Dashboard</span>
              </a>
              <a
                href="/recommendations"
                className="flex items-center space-x-2 text-purple-300 hover:text-white transition-colors"
              >
                <FaLightbulb className="w-5 h-5" />
                <span>Recommendations</span>
              </a>
              <a
                href="/notifications"
                className="flex items-center space-x-2 text-purple-300 hover:text-white transition-colors"
              >
                <FaBell className="w-5 h-5" />
                <span>Notifications</span>
              </a>
            </nav>

            <div className="flex items-center space-x-6">
              <button className="relative text-purple-300 hover:text-white transition-colors">
                <FaBell className="w-6 h-6 accent-glow" />
                <span className="absolute top-0 right-0 bg-purple-600 text-white text-xs rounded-full px-1.5 py-0.5 gold-accent-text">
                  3
                </span>
              </button>
              <div className="flex items-center space-x-3">
                <FaUserCircle className="w-8 h-8 text-purple-300" />
                <div className="hidden lg:block">
                  <div className="text-sm font-medium text-white">John Doe</div>
                  <div className="text-xs text-purple-300">Content Creator</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
    )
  } catch (error) {
    console.error('Failed to render header:', error);
    return <div className="text-red-500">Failed to render header.</div>;
  }
}

export default Header
