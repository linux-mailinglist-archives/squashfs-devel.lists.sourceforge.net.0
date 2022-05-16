Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5EB52E33F
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007I5-7Y; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqYJz-0000d0-1U
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qABwBGQeqRGyH4s8D1h5zI8q8n2HwL4/08QSvpU+KQ=; b=VmEkcfwLonkMv6ChiVyD69ikpX
 yVlHiE7bZWqE/yF717SEID/nSBuQAQWIa8cCJwsOao7jKp85kDqjUrnYvlkV2AMPRvNYUIPjscvB2
 S5GK29i+NMW1LZZS3KZytFM/qSOZQ0uKUfU5lXRRdz6aHNtWckRzZ1xN2JQuJs5hZ/LA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5qABwBGQeqRGyH4s8D1h5zI8q8n2HwL4/08QSvpU+KQ=; b=N
 zhdqcopro0gK6uHCYkUDM++go8SRid7XeoJe16a+6hRSYobbRWC+bsBGnPwR8DHrtji2fF431FpDV
 ktPn8zq79aWDsisB0Lg1YDptk1RTAnF1f/evbie7YVn66cFE0Z0crGKVqa7O8vWTSuzB4cfOUDgF5
 caZ9ZtshppZLzq4c=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqYJu-00Gwua-1Q
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:51:27 +0000
Received: by mail-pl1-f170.google.com with SMTP id i1so14045445plg.7
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qABwBGQeqRGyH4s8D1h5zI8q8n2HwL4/08QSvpU+KQ=;
 b=VSDQMlv8C2J9HnzLs/CYYNTmLUOIJa3xmXUvEFaE+GppMb+UfDrfgb9MvmDs2L4DgE
 fAw8N2GLUo5h45FxctT4TbOBV7xvP5WLkymIZTfaMtTUwmiFhjVIi+IE9N+TRYbne3W/
 xUqNzX7bvQkIEWp/4H5F17zPthIGutwTcK3pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qABwBGQeqRGyH4s8D1h5zI8q8n2HwL4/08QSvpU+KQ=;
 b=jqQ69wiTyfqMQNbfobLwzUc02krE8bsVBLSrJPL/JZDnF+v0bgauu+eZ9QQpZfCsr5
 O1gEjVvKkrieBk4VqmZPnv254Y91wAu9I68CyuFMr2qXmzELTag2EOhfAREYOYBIbiio
 CHu+jS0Mthw7pW04wLdR6u3wVUeq1227lOb4r3qGvUjuMaA2+YOkqdoRuPMuXrO2lGj5
 Ia+vPwHYrwXiTcTe+j5sJtR/9/U6GChsbF2SeBWG5n/lFm5R/0ewynsK5SKXXbCfw4/C
 WcAU7VG5DXkL40ebp9SENSlpYAux3qlolQRBc8XE0Q7VZzre94z+6fUcM1/jWQZU6b5k
 FMbw==
X-Gm-Message-State: AOAM532yinXw/yybUq9i7mAbzqAds6bwkMFTJpx8SPLVNLg3o5EJwH+R
 kE1Uxq5vcy/QP+hWPGJqE8cD6A==
X-Google-Smtp-Source: ABdhPJzEhc6Nq+jLxQgfZOwbXkTmoQiUhXix3nS4TzvMkiag7XSXc+R5p+oyIy22fYfHXoiCxcP8fQ==
X-Received: by 2002:a17:90b:33ca:b0:1dc:e5b8:482b with SMTP id
 lk10-20020a17090b33ca00b001dce5b8482bmr29885251pjb.165.1652698275616; 
 Mon, 16 May 2022 03:51:15 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cdcb:c865:6f65:d875])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a655bce000000b003db8dd388afsm6332778pgr.10.2022.05.16.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:51:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 16 May 2022 18:50:59 +0800
Message-Id: <20220516105100.1412740-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit c1f6925e1091("mm: put readahead pages in cache
 earlier")
 requires fs to implement readahead callback. Otherwise there will be a
 performance
 regression. Commit 9eec1d897139("squashfs: provide backing_dev_info in order
 to disable read-ahead") mitigates the performance drop issue for squashfs
 by closing readahead for it. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqYJu-00Gwua-1Q
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: [Squashfs-devel] [PATCH 0/2] Implement readahead for squashfs
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Commit c1f6925e1091("mm: put readahead pages in cache earlier") requires
fs to implement readahead callback. Otherwise there will be a
performance regression.

Commit 9eec1d897139("squashfs: provide backing_dev_info in order to
disable read-ahead") mitigates the performance drop issue for squashfs
by closing readahead for it.

This series implements readahead callback for squashfs. The previous
discussion are in [1] and [2].

[1] https://lore.kernel.org/all/CAJMQK-g9G6KQmH-V=BRGX0swZji9Wxe_2c7ht-MMAapdFy2pXw@mail.gmail.com/T/
[2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m4af4473b94f98a4996cb11756b633a07e5e059d1

Hsin-Yi Wang (2):
  Revert "squashfs: provide backing_dev_info in order to disable
    read-ahead"
  squashfs: implement readahead

 fs/squashfs/file.c  | 77 +++++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/super.c | 33 -------------------
 2 files changed, 77 insertions(+), 33 deletions(-)

-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
