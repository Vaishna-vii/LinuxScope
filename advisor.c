#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

typedef struct RecommendationRule RecommendationRule;

struct RecommendationRule {
    char name[64];
    bool (*check_condition)(void);
    void (*generate_suggestion)(void);
};

bool check_high_memory() {
    FILE *fp = fopen("/proc/meminfo", "r");
    if (!fp) return false;
    
    unsigned long mem_total = 0, mem_free = 0, buffers = 0, cached = 0;
    char buffer[128];
    while (fgets(buffer, sizeof(buffer), fp)) {
        if (sscanf(buffer, "MemTotal: %lu kB", &mem_total) == 1);
        else if (sscanf(buffer, "MemFree: %lu kB", &mem_free) == 1);
        else if (sscanf(buffer, "Buffers: %lu kB", &buffers) == 1);
        else if (sscanf(buffer, "Cached: %lu kB", &cached) == 1);
    }
    fclose(fp);

    if (mem_total == 0) return false;
    unsigned long used = mem_total - (mem_free + buffers + cached);
    double percent = ((double)used / (double)mem_total) * 100.0;
    
    return percent > 80.0;
}

void suggest_high_memory() {
    printf("\033[93m[RECOMMENDATION] Memory usage is critically high (>80%%).\033[0m\n");
    printf("-> Suggestion: Run 'ps -eo pid,comm,%%mem --sort=-%%mem | head -n 5' to find heavy processes.\n");
    printf("-> Action: Consider closing memory-heavy applications.\n\n");
}

RecommendationRule* create_memory_rule() {
    RecommendationRule *rule = malloc(sizeof(RecommendationRule));
    strcpy(rule->name, "Memory Health Advisor");
    rule->check_condition = check_high_memory;
    rule->generate_suggestion = suggest_high_memory;
    return rule;
}

int main() {
    printf("=== LINUXSCOPE OOP AI/Rule-Based Advisor ===\n");

    RecommendationRule *rules[] = {
        create_memory_rule()
    };
    int rule_count = 1;

    bool issues_found = false;
    for (int i = 0; i < rule_count; i++) {
        if (rules[i]->check_condition()) {
            issues_found = true;
            rules[i]->generate_suggestion();
        }
        free(rules[i]);
    }

    if (!issues_found) {
        printf("\033[92m[STATUS] All system metrics look healthy. No recommendations at this time.\033[0m\n");
    }

    return 0;
}
