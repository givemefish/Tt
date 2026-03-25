<template>
  <div class="app-container">
    <!-- 頂部導覽列 -->
    <header class="app-header">
      <div class="header-brand">
        <svg class="brand-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M3 3h18v18H3V3z" stroke="currentColor" stroke-width="1.5" fill="none"/>
          <path d="M7 16l4-6 3 4 2-3 3 5" stroke="#4fc3f7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="brand-name">TradeManager</span>
        <span class="brand-sub">委託單管理系統</span>
      </div>
      <nav class="header-nav">
        <span class="nav-item active">委託單列表</span>
        <span class="nav-item">系統設定</span>
      </nav>
      <div class="header-right">
        <span class="user-info">
          <span class="user-dot"></span>
          管理員
        </span>
      </div>
    </header>

    <!-- 主內容區 -->
    <main class="app-main">
      <TradeGrid />
    </main>
  </div>
</template>

<script>
import TradeGrid from "./components/TradeGrid.vue";

export default {
  name: "App",
  components: { TradeGrid },
};
</script>

<style>
/* ── Global Reset ── */
*, *::before, *::after { box-sizing: border-box; }
html, body {
  margin: 0;
  padding: 0;
  height: 100%;
  font-family: "Segoe UI", "PingFang TC", "Microsoft JhengHei", sans-serif;
  background: #f0f2f5;
  color: #212529;
}
#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

/* ── Header ── */
.app-header {
  height: 56px;
  background: linear-gradient(90deg, #0d1b3e 0%, #1565c0 100%);
  display: flex;
  align-items: center;
  padding: 0 24px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.3);
  flex-shrink: 0;
  gap: 24px;
  z-index: 100;
}
.header-brand {
  display: flex;
  align-items: center;
  gap: 10px;
}
.brand-icon {
  width: 28px;
  height: 28px;
  color: #fff;
}
.brand-name {
  font-size: 18px;
  font-weight: 800;
  color: #fff;
  letter-spacing: 1px;
}
.brand-sub {
  font-size: 11px;
  color: rgba(255,255,255,0.6);
  border-left: 1px solid rgba(255,255,255,0.3);
  padding-left: 10px;
  margin-left: 2px;
}
.header-nav {
  display: flex;
  gap: 4px;
  flex: 1;
}
.nav-item {
  padding: 6px 16px;
  border-radius: 20px;
  font-size: 13px;
  color: rgba(255,255,255,0.75);
  cursor: pointer;
  transition: all 0.2s;
}
.nav-item:hover { background: rgba(255,255,255,0.1); color: #fff; }
.nav-item.active { background: rgba(255,255,255,0.2); color: #fff; font-weight: 600; }
.header-right { margin-left: auto; }
.user-info {
  display: flex;
  align-items: center;
  gap: 7px;
  color: rgba(255,255,255,0.9);
  font-size: 13px;
}
.user-dot {
  width: 8px;
  height: 8px;
  background: #4caf50;
  border-radius: 50%;
  display: inline-block;
}

/* ── Main ── */
.app-main {
  flex: 1;
  padding: 16px 20px 12px;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* ── RWD ── */
@media (max-width: 768px) {
  .app-header { padding: 0 12px; }
  .brand-sub { display: none; }
  .header-nav { display: none; }
  .app-main { padding: 10px; }
}
</style>
