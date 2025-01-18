import React from 'react'

    export function Card({ className, ...props }) {
      return (
        <div
          className={`glass-effect purple-glow rounded-xl border border-purple-900/50 shadow-xl transition-all hover:border-purple-700/50 ${className}`}
          {...props}
        />
      )
    }

    export function CardHeader({ className, ...props }) {
      return (
        <div
          className={`flex flex-col space-y-1.5 p-6 ${className}`}
          {...props}
        />
      )
    }

    export function CardTitle({ className, ...props }) {
      return (
        <h3
          className={`text-2xl font-semibold leading-none tracking-tight gradient-text ${className}`}
          {...props}
        />
      )
    }

    export function CardDescription({ className, ...props }) {
      return (
        <p
          className={`text-sm text-purple-300/70 ${className}`}
          {...props}
        />
      )
    }

    export function CardContent({ className, ...props }) {
      return <div className={`p-6 pt-0 ${className}`} {...props} />
    }

    export function CardFooter({ className, ...props }) {
      return (
        <div
          className={`flex items-center p-6 pt-0 ${className}`}
          {...props}
        />
      )
    }
